Date: Thu, 31 Oct 2019 12:43:51 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Don't reassign mpss
 region on shutdown
Message-ID: <20191031194347.GO1929@tuxbook-pro>
References: <20191031184632.2938295-1-bjorn.andersson@linaro.org>
 <20191031184632.2938295-2-bjorn.andersson@linaro.org>
 <CAOCk7Noq8dvKsWzAfAXRGhmoMG4_tHD0kw8_KVEBvyjm_fGc5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7Noq8dvKsWzAfAXRGhmoMG4_tHD0kw8_KVEBvyjm_fGc5A@mail.gmail.com>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, MSM <linux-arm-msm@vger.kernel.org>, linux-remoteproc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, stable@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 31 Oct 12:36 PDT 2019, Jeffrey Hugo wrote:

> On Thu, Oct 31, 2019 at 12:48 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > Trying to reclaim mpss memory while the mba is not running causes the
> > system to crash on devices with security fuses blown, so leave it
> > assigned to the remote on shutdown and recover it on a subsequent boot.
> >
> > Fixes: 6c5a9dc2481b ("remoteproc: qcom: Make secure world call for mem ownership switch")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> 
> Excellent.  This addresses the issue I was seeing with the Lenovo Miix 630
> 

Sweet!

> Reviewed-by: Jeffrey Hugo<jeffrey.l.hugo@gmail.com>
> Tested-by: Jeffrey Hugo<jeffrey.l.hugo@gmail.com>

Thanks!

Regards,
Bjorn
