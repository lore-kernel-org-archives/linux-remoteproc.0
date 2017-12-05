Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 5 Dec 2017 09:33:16 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 1/5] soc: qcom: Introduce QMI encoder/decoder
Message-ID: <20171205173316.GP28761@minitux>
References: <20171130011644.9421-1-bjorn.andersson@linaro.org>
 <20171130011644.9421-2-bjorn.andersson@linaro.org>
 <6c6be375-6895-ecaf-9844-40774f6bdd5c@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c6be375-6895-ecaf-9844-40774f6bdd5c@codeaurora.org>
To: Jitendra Sharma <shajit@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 01 Dec 01:10 PST 2017, Jitendra Sharma wrote:

> Hi Bjorn,
> 

Hi Jitendra,

> On 11/30/2017 6:46 AM, Bjorn Andersson wrote:
> > +static int qmi_calc_min_msg_len(struct qmi_elem_info *ei_array,
> > +				int level)
> > +{
> > +	int min_msg_len = 0;
> min_msg_len should be u32 as it would not be negative

IMHO all these sizes should be size_t and there are a few places where
we should add "const" specifier to pointers. But I refrained from
"fixing" these up in an effort to keep things as close to the downstream
implementation as possible.

If Andy agrees I'm hoping that we can take this version and then follow
up with a separate patch, making the review more explicit and make it
easier to track down any potential regressions from such a change.


Thank you for the review!

Regards,
Bjorn
