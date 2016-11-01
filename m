Return-Path: <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 1/1] remoteproc: Add support for xo clock
References: <1477429046-26855-1-git-send-email-spjoshi@codeaurora.org>
 <20161101000555.GK25787@tuxbot>
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <564faf01-f4d7-4bdb-ee48-76a893d3d4c0@codeaurora.org>
Date: Tue, 1 Nov 2016 10:41:58 -0700
MIME-Version: 1.0
In-Reply-To: <20161101000555.GK25787@tuxbot>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Sarangdhar Joshi <spjoshi@codeaurora.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Trilok Soni <tsoni@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 10/31/2016 05:05 PM, Bjorn Andersson wrote:
> On Tue 25 Oct 13:57 PDT 2016, Sarangdhar Joshi wrote:
>
>> Add xo clock support required to boot up Qualcomm ADSP processor.
>> The ADSP remoteproc driver keeps xo clock enabled until the
>> driver receives "handover" irq, in order to allow ADSP processor
>> to vote for xo clock with rpm.
> Looks good, thanks.
>
> We have to add the clock to the DT binding and run that by Rob again,
> before merging the driver and this patch.
>

Maybe we should make the xo clock required. We always have a clock for
it somewhere, either RPM controlled or as a fixed rate clock so it
should work just as well.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
