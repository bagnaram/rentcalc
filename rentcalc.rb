# Rentcalc, a simple billing report generator.
# 
# Matt Bagnara
# github.com/bagnaram
# 
# CC-BY-SA

rent=Array.new
gas=Array.new
elec=Array.new
internet=Array.new
util=Array.new
total=Array.new
total2=Array.new

num=0
text=File.open('bills.txt').read
text.each_line do |line|
  i=num/6
  val=line.chomp
  if val =~ /^[^#].*$/ then
    rent[i] = Float(val) if num % 6 == 0
    gas[i] = Float(val) if num % 6 == 1
    elec[i] = Float(val) if num % 6 == 2
    internet[i] = Float(val) if num % 6 == 3
    util[i] = Float(val) if num % 6 == 4
    total[i] = rent[i] + gas[i] + elec[i] +internet[i] + util[i] if num % 6 == 5
    total2[i] = total[i] - rent[i] if num % 6 == 5
    num+=1
  end
#break if num > 12
end

print "Our bill:\n\n\n"
printf("%1$-30s %2$20s %3$10s\n", "Item", "Previous Month", "Cost")
print("==============================================================\n")
printf("%1$-30s %2$20.2f %3$10.2f\n", "Rent", rent[1], rent[0])
printf("%1$-30s %2$20.2f %3$10.2f\n", "Elec", elec[1], elec[0])
printf("%1$-30s %2$20.2f %3$10.2f\n", "Utilities", util[1], util[0])
printf("%1$-30s %2$20.2f %3$10.2f\n", "Gas", gas[1], gas[0])
printf("%1$-30s %2$20.2f %3$10.2f\n", "Internet", internet[1], internet[0])
print "\n\n"
print("==============================================================\n")
printf("%1$-51s %2$10.2f\n", "Subtotal", total[0])
printf("%1$-51s %2$10.2f\n", "Divided by 3", total[0]/3)
print("==============================================================\n")

require "rinruby"
R.quit

r_runtime=RinRuby.new(false)

r_runtime.rent=rent
r_runtime.elec=elec
r_runtime.util=util
r_runtime.gas=gas
r_runtime.internet=internet
r_runtime.total=total2

procedure=""

procedure = <<EOF
rev(rent)
rev(elec)
rev(util)
rev(gas)
rev(internet)
rev(total)

png(file = "line_chart_label_colored.jpg")
plot(internet, type="o",xlab = "Months Ago", col="black", ylab = "Cost USD", main = "Monthly costs", xlim=c(12,1), ylim=c(0,300))

lines(elec, type="o", col = "red")
lines(util, type="o", col = "blue")
lines(gas, type="o", col = "green")
lines(total, type="o", col = "purple", lty=2)

legend("topleft", col = c("black", "red",  "blue", "green", "purple"), lty=c(1,1,1,1,2),
                        legend = c("Internet", "Electric", "Utilities", "Gas", "Total"))
EOF

r_runtime.eval(procedure) 
