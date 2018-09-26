Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 26 Sep 2018 21:18:53 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH] remoteproc: qcom: pas: Add QCS404 remoteprocs
In-Reply-To: <20180925233550.GB27436@tuxbook-pro>
References: <20180920172237.30965-1-bjorn.andersson@linaro.org>
 <f0887494a9957496399046bac9b1fa32@codeaurora.org>
 <20180925233550.GB27436@tuxbook-pro>
Message-ID: <78799383c083420b8109455c463fc730@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel-owner@vger.kernel.org, linux-remoteproc-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2018-09-26 05:05, Bjorn Andersson wrote:
> On Tue 25 Sep 03:18 PDT 2018, Sibi Sankar wrote:
>> On 2018-09-20 22:52, Bjorn Andersson wrote:
>> > diff --git a/drivers/remoteproc/qcom_adsp_pil.c
>> > b/drivers/remoteproc/qcom_adsp_pil.c
>> > index da2254ea1135..fcbb816a9698 100644
>> > --- a/drivers/remoteproc/qcom_adsp_pil.c
>> > +++ b/drivers/remoteproc/qcom_adsp_pil.c
>> > @@ -362,10 +362,22 @@ static const struct adsp_data slpi_resource_init =
>> > {
>> >  		.ssctl_id = 0x16,
>> >  };
>> >
>> > +static const struct adsp_data wcss_resource_init = {
>> > +	.crash_reason_smem = 421,
>> > +	.firmware_name = "wcnss.mdt",
>> > +	.pas_id = 6,
>> > +	.ssr_name = "mpss",
>> > +	.sysmon_name = "wlan",
>> 
>> Shouldn't the sysmon name be "wcnss" instead of "wlan"?
>> 
> 
> I derived this from the downstream kernel, perhaps I got it wrong?
> 

I could see that the label is "wcnss" and glink-label is "mpss" 
downstream.

> Regards,
> Bjorn

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
