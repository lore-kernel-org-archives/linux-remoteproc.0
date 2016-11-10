Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v2 1/3] firmware: qcom: scm: add a video command for state
 setting
References: <1478539853-23218-1-git-send-email-stanimir.varbanov@linaro.org>
 <1478539853-23218-2-git-send-email-stanimir.varbanov@linaro.org>
 <20161110015251.GC16026@codeaurora.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <1c57a006-ddab-f44a-8ec8-24de62a6e02f@linaro.org>
Date: Thu, 10 Nov 2016 10:05:36 +0200
MIME-Version: 1.0
In-Reply-To: <20161110015251.GC16026@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <sboyd@codeaurora.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On 11/10/2016 03:52 AM, Stephen Boyd wrote:
> On 11/07, Stanimir Varbanov wrote:
>> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
>> index d95c70227c05..7e364691a87c 100644
>> --- a/drivers/firmware/qcom_scm.c
>> +++ b/drivers/firmware/qcom_scm.c
>> @@ -320,6 +320,22 @@ bool qcom_scm_is_available(void)
>>  }
>>  EXPORT_SYMBOL(qcom_scm_is_available);
>>  
>> +int qcom_scm_video_set_state(u32 state, u32 spare)
>> +{
>> +	int ret;
>> +
>> +	ret = qcom_scm_clk_enable();
> 
> Do we need clk control for this? Usually it's only required for
> crypto engine things, and turning on video doesn't sound like it
> uses crypto. I don't think downstream android kernel does this.

Correct, the crypto clk is not needed.

-- 
regards,
Stan
