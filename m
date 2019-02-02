Return-Path: <govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 02 Feb 2019 21:02:26 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v3 4/7] clk: qcom: Add WCSS gcc clock control for QCS404
In-Reply-To: <20181215175657.GB12886@minitux>
References: <20181215103557.2748-1-govinds@codeaurora.org>
 <20181215103557.2748-5-govinds@codeaurora.org>
 <20181215175657.GB12886@minitux>
Message-ID: <1b902e355d7b4f03229f821082e21147@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, sboyd@kernel.org, linux-clk@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2018-12-15 23:26, Bjorn Andersson wrote:
> On Sat 15 Dec 02:35 PST 2018, Govind Singh wrote:
>> diff --git a/drivers/clk/qcom/gcc-qcs404.c 
>> b/drivers/clk/qcom/gcc-qcs404.c
> [..]
>> @@ -2726,6 +2770,11 @@ static int gcc_qcs404_probe(struct 
>> platform_device *pdev)
>>  			return ret;
>>  	}
>> 
>> +#ifdef CONFIG_QCS_WCSSCC_404
> 
> We don't do compile time configuration of things like this, expect all
> variants of QCS404 (regardless of security solution) to run off the 
> same
> kernel binary.
> 
> Instead use the recently introduced "protected-clocks" property.
> 

Fixed in v4. Seems LPASS is no more using "protected-clocks", i used 
"unprotected-clocks" property to avoid inverted logic.

> Regards,
> Bjorn
