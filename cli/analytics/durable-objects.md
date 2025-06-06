---
order: 1
summary: Dump durable objects stats via the Cloudflare GraphQL Analytics API
title: denoflare analytics durable-objects
type: overview
---

# denoflare analytics durable-objects
Dump durable objects stats via the Cloudflare GraphQL Analytics API

## --help
```
$ denoflare analytics durable-objects --help
denoflare-analytics-durable-objects 0.7.0

Dump durable objects stats via the Cloudflare GraphQL Analytics API

USAGE:
    denoflare analytics durable-objects [OPTIONS]

OPTIONS:
    --namespace-id <string>  Filter to single Durable Objects namespace id
    --start <yyyy-mm-dd>     Start of the analysis range (inclusive)
    --end <yyyy-mm-dd>       End of the analysis range (inclusive)
    --budget                 If set, dump GraphQL API request budget
    --totals                 If set, dump storage read/write unit and request/subrequest totals
                             
    --config <path>          Path to config file (default: .denoflare in cwd or parents)
    --profile <name>         Explicit profile to use from config file
    --account-id <string>    Explicit Cloudflare account id to use for authentication
    --api-token <string>     Explicit Cloudflare API token to use for authentication
                             
    --help                   Print help information
    --verbose                Toggle verbose output (when applicable)
```

## Example output

```
$ dfd analytics durable-objects --start 2022-04-24 --end 2022-05-22

      date     req         ws.max  ws.in  ws.out         subreq           active.gbs             reads           writes         deletes         storage         total.cost
2022-04-24  126870  $0.02       0      0       0  $0.00    7370  $0.00   2248.98gb-s   $0.07  25643270    $5.13  161440  $0.16    26660  $0.03  10.38gb  $0.07       $5.48
2022-04-25  202450  $0.03       0      0       0  $0.00    6820  $0.00   2740.59gb-s   $0.09  10841540    $2.17  355830  $0.36    28820  $0.03  10.43gb  $0.07       $2.74
2022-04-26  208000  $0.03       1      0      40  $0.00    6510  $0.00   2847.32gb-s   $0.09   9111270    $1.82  388710  $0.39    24220  $0.02  10.48gb  $0.07       $2.43
2022-04-27  206800  $0.03       1      0       0  $0.00    6320  $0.00   2931.81gb-s   $0.09   9611410    $1.92  380100  $0.38    23550  $0.02  10.53gb  $0.07       $2.52
2022-04-28  200340  $0.03       3      0       0  $0.00    7420  $0.00   3348.24gb-s   $0.10  10383190    $2.08  374920  $0.37    30400  $0.03  10.58gb  $0.07       $2.69
2022-04-29  186480  $0.03       3      0     210  $0.00    6630  $0.00   3272.82gb-s   $0.10  14734460    $2.95  329590  $0.33    18730  $0.02  10.62gb  $0.07       $3.50
2022-04-30  130810  $0.02       4      0    4780  $0.00    5820  $0.00  12119.85gb-s   $0.38  25632220    $5.13  190010  $0.19    23500  $0.02  10.65gb  $0.07       $5.81
2022-05-01  129980  $0.02       4      0    4570  $0.00    7100  $0.00  13909.94gb-s   $0.43  24708780    $4.94  170080  $0.17    15650  $0.02  10.68gb  $0.07       $5.65
2022-05-02  200130  $0.03       4      0    3430  $0.00    7010  $0.00  11603.98gb-s   $0.36   8593910    $1.72  334090  $0.33    33750  $0.03  10.72gb  $0.07       $2.55
2022-05-03  201910  $0.03      15     10    7830  $0.00    7040  $0.00  14016.41gb-s   $0.44   9984680    $2.00  376150  $0.38    24200  $0.02  10.77gb  $0.07       $2.94
2022-05-04  214960  $0.03      16      0    7810  $0.00    7300  $0.00  12868.29gb-s   $0.40  10944820    $2.19  399550  $0.40    19490  $0.02  10.82gb  $0.07       $3.12
2022-05-05  202830  $0.03       8      0    5170  $0.00    8680  $0.00  14937.47gb-s   $0.47   9812930    $1.96  354680  $0.35    28200  $0.03  10.87gb  $0.07       $2.92
2022-05-06  194540  $0.03       1      0    3900  $0.00    8730  $0.00  12130.33gb-s   $0.38  11017360    $2.20  341250  $0.34    22120  $0.02  10.91gb  $0.07       $3.05
2022-05-07  144020  $0.02       1      0    4480  $0.00    9690  $0.00  14535.36gb-s   $0.45  22080480    $4.42  211820  $0.21    26280  $0.03  10.94gb  $0.07       $5.20
2022-05-08  131300  $0.02       2      0    6850  $0.00    8290  $0.00  13988.98gb-s   $0.44  30937430    $6.19  186540  $0.19    20700  $0.02  10.97gb  $0.07       $6.93
2022-05-09  213160  $0.03       1      0    4670  $0.00    9520  $0.00  13303.48gb-s   $0.42  10327890    $2.07  373180  $0.37    29460  $0.03  11.02gb  $0.07       $2.99
2022-05-10  214770  $0.03       1      0    5430  $0.00    7680  $0.00  14145.88gb-s   $0.44   8290930    $1.66  425260  $0.43    27220  $0.03  11.07gb  $0.07       $2.66
2022-05-11  202400  $0.03       2     10    6100  $0.00    7490  $0.00  13328.40gb-s   $0.42  10573500    $2.11  347830  $0.35    31300  $0.03  11.11gb  $0.07       $3.02
2022-05-12  202010  $0.03       1      0    5740  $0.00    7030  $0.00  15540.45gb-s   $0.49  12950970    $2.59  340250  $0.34    29580  $0.03  11.16gb  $0.07       $3.55
2022-05-13  233690  $0.04   65538      0    7270  $0.00   10180  $0.00  13400.11gb-s   $0.42  26305590    $5.26  387420  $0.39    38980  $0.04  11.21gb  $0.07       $6.22
2022-05-14  185050  $0.03   65538     20    4650  $0.00   11950  $0.00  14998.67gb-s   $0.47  48220260    $9.64  191140  $0.19    27460  $0.03  11.24gb  $0.07      $10.44
2022-05-15  135060  $0.02       1      0    3650  $0.00   10030  $0.00  12710.02gb-s   $0.40  34342450    $6.87  206970  $0.21    32390  $0.03  11.26gb  $0.08       $7.60
2022-05-16  202780  $0.03       2      0    5220  $0.00    8280  $0.00  14053.43gb-s   $0.44  16441340    $3.29  387130  $0.39    25040  $0.03  11.31gb  $0.08       $4.25
2022-05-17  246960  $0.04       1      0    5750  $0.00    8400  $0.00  13454.88gb-s   $0.42  22049420    $4.41  396430  $0.40    26340  $0.03  11.36gb  $0.08       $5.37
2022-05-18  222690  $0.03       1      0    7070  $0.00    7770  $0.00  13102.70gb-s   $0.41  23515670    $4.70  375390  $0.38    33750  $0.03  11.41gb  $0.08       $5.63
2022-05-19  207190  $0.03       1      0    6080  $0.00   11120  $0.00  13846.00gb-s   $0.43  12458810    $2.49  341840  $0.34    30950  $0.03  11.45gb  $0.08       $3.41
2022-05-20  195080  $0.03       3      0    7300  $0.00    9270  $0.00  13611.98gb-s   $0.43  11319860    $2.26  340280  $0.34    27940  $0.03  11.50gb  $0.08       $3.16
2022-05-21  130420  $0.02       3      0    5500  $0.00    9430  $0.00  14031.59gb-s   $0.44  26076580    $5.22  187880  $0.19    20880  $0.02  11.52gb  $0.08       $5.96
2022-05-22  151510  $0.02       2      0    7450  $0.00   10590  $0.00  14004.85gb-s   $0.44  54990540   $11.00  181440  $0.18    23980  $0.02  11.55gb  $0.08      $11.74
                                                                                                                                                                          
est 30-day          $0.85                         $0.00          $0.04                $10.61            $106.48          $9.49           $0.80           $2.28     $130.54
minus free          $0.70                         $0.00          $0.04                 $0.00            $106.28          $8.49           $0.00           $2.08     $117.58

per namespace:
$113.17 2c86df7138295fe4a808601461309da1 script1 BetaDO
  $8.18 51154e6f3f283f6585deac84d777a8b8 script7 AlphaDO
  $6.89 4b5753137fdbb49fe107047c4bc509ae script3 DeltaDO
  $0.02 c08e8625b704b4efbbf52539ab22cbc6 script2 GammaDO
  $0.00 0785a5f2fa63e846e5b745aa5fb30625 script5 ZetaDO
  $0.00 7642f180e7a7adae1cc444587ed22940 script4 EpsilonDO
  $0.00 7fd47b04e803150107753bfa2a77130d script6 EtaDO
```