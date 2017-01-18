Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 18 Jan 2017 15:34:50 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC 1/3] remoteproc: qcom: Introduce Qualcomm low pass sensor
 peripheral loader.
Message-ID: <20170118233450.GW10531@minitux>
References: <1484229217-23364-1-git-send-email-akdwived@codeaurora.org>
 <1484229217-23364-2-git-send-email-akdwived@codeaurora.org>
 <3ca26853-af4b-16d7-2149-700960234a15@codeaurora.org>
 <56fc8273-3319-06e3-c474-cf6abdc7c12c@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56fc8273-3319-06e3-c474-cf6abdc7c12c@codeaurora.org>
To: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>, sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sun 15 Jan 21:15 PST 2017, Dwivedi, Avaneesh Kumar (avani) wrote:

> 
> 
> On 1/13/2017 2:11 AM, Sarangdhar Joshi wrote:
> > Hi Avaneesh,
> > 
> > On 01/12/2017 05:53 AM, Avaneesh Kumar Dwivedi wrote:
> > > This patch is to load and boot slpi core on Qualcomm plateforms. It is
> > > used for loading the firmware images of the subsystems into memory
> > > and preparing the subsystem's processor to execute code.
> > 
> > Can't we modify qcom_adsp_pil.c to use SLPI as well?
> 
> clocks, regulators, PAS_ID, firmware name, crash reason smem id these are
> few driver specific resource/variable, if it is ok to initialize these
> variables  based on compatible string, i think we can have single driver for
> adsp and slpi. let me know your further comment.

I would prefer this too.

The only thing that stands out is that you're not allowed to
regulator_set_voltage(5), because that's not how we will do corners
upstream - which tells us that we need to get corner voltages sorted
out.


I'm still undecided on aggre2_noc being handled in this driver or in a
aggre2_noc bus surrounding the device, but that's a smaller issue than
the corners.

Regardless of these two issues we want a common adsp + slpi driver, so
please submit a patch where you add the slpi support to the existing
adsp driver.

Regards,
Bjorn
