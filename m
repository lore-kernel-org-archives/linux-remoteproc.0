Return-Path: <govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 02 Feb 2019 21:05:15 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: clock: qcom: Introduce QCOM WCSS
 Q6DSP clock bindings
In-Reply-To: <154507522782.19322.17858102871851741802@swboyd.mtv.corp.google.com>
References: <20181215103557.2748-1-govinds@codeaurora.org>
 <20181215103557.2748-2-govinds@codeaurora.org>
 <154507522782.19322.17858102871851741802@swboyd.mtv.corp.google.com>
Message-ID: <1285eb4d33b796fd523634cead8142bf@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-clk@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2018-12-18 01:03, Stephen Boyd wrote:
> Quoting Govind Singh (2018-12-15 02:35:51)
>> Add device tree bindings for WiFi QDSP subsystem clock controls
>> found in OCS405 soc.


> 
>> +- reg                  : shall contain base register address and 
>> size,
>> +                         in the order
>> +                       Index-0 maps to WCSS_Q6SSTOP clocks register 
>> region
>> +                       Index-1 maps to WCSS_TCSR register region
>> +                       Index-2 maps to WCSS_QDSP6SS register region
>> +
> 
> Index 0, Index 1, Index 2? Not sure why there's a hyphen there.
> 

Fixed in v4.

>> +Optional properties :
>> +- reg-names    : register names of WCSS domain
>> +                "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss".
>> +
>> +Example:
>> +The below node has to be defined in the cases where the WCSS 
>> peripheral loader
>> +would bring the subsystem out of reset.
>> +
>> +       clock_wcsscc: qcom,wcsscc@7000000 {
> 
> clock-controller@7000000
> 
>> +               compatible = "qcom,qcs404-wcsscc";
>> +               reg = <0x07500000 0x4e000>, <0x07550000 0x8012>, 
>> <0x07400000 0x104>;
> 
> And then that unit address doesn't match the first offset so that needs
> fixing too.
> 

Fixed in V4.

>> +               reg-names = "wcss_q6sstop", "wcnss_tcsr", 
>> "wcss_qdsp6ss";
>> +               #clock-cells = <1>;
>> +       };

BR,
Govind
