Return-Path: <govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 02 Feb 2019 21:03:34 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v3 3/7] dt-bindings: clock: qcom: Add QCOM WCSS GCC clock
 bindings
In-Reply-To: <154507529252.19322.2985382543561079731@swboyd.mtv.corp.google.com>
References: <20181215103557.2748-1-govinds@codeaurora.org>
 <20181215103557.2748-4-govinds@codeaurora.org>
 <154507529252.19322.2985382543561079731@swboyd.mtv.corp.google.com>
Message-ID: <6e07c00781d8b93a1cc361f946bff30f@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-clk@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2018-12-18 01:04, Stephen Boyd wrote:
> Quoting Govind Singh (2018-12-15 02:35:53)
>> Add device tree bindings for WiFi QDSP gcc clock controls found in
>> QCS404 soc.
>> 
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  include/dt-bindings/clock/qcom,gcc-qcs404.h | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h 
>> b/include/dt-bindings/clock/qcom,gcc-qcs404.h
>> index 00ab0d77b38a..8f800adda225 100644
>> --- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
>> +++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
>> @@ -146,6 +146,8 @@
>>  #define GCC_MDP_TBU_CLK                                        138
>>  #define GCC_QDSS_DAP_CLK                               139
>>  #define GCC_DCC_XO_CLK                                 140
>> +#define GCC_WCSS_Q6_AHB_CBCR_CLK                       141
>> +#define GCC_WCSS_Q6_AXIM_CBCR_CLK                      142
> 
> Does the register really call it FOO_CBCR_CLK? I'd prefer we drop the
> CBCR part unless you really want it to keep it.
> 

Thanks, removed CBCR in v4.

>> 
>>  #define GCC_GENI_IR_BCR                                        0
>>  #define GCC_USB_HS_BCR                                 1
