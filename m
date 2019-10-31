Return-Path: <jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
References: <20191031184632.2938295-1-bjorn.andersson@linaro.org>
 <20191031184632.2938295-2-bjorn.andersson@linaro.org> <CAOCk7Noq8dvKsWzAfAXRGhmoMG4_tHD0kw8_KVEBvyjm_fGc5A@mail.gmail.com>
 <20191031194347.GO1929@tuxbook-pro>
In-Reply-To: <20191031194347.GO1929@tuxbook-pro>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Thu, 31 Oct 2019 16:02:43 -0600
Message-ID: <CAOCk7NoC+BmB7UH=-=g7ufmGUAfrc9JcPxwnVh9ytb9Xuq4FTQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Don't reassign mpss region
 on shutdown
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, MSM <linux-arm-msm@vger.kernel.org>, linux-remoteproc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, stable@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Oct 31, 2019 at 1:43 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 31 Oct 12:36 PDT 2019, Jeffrey Hugo wrote:
>
> > On Thu, Oct 31, 2019 at 12:48 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > Trying to reclaim mpss memory while the mba is not running causes the
> > > system to crash on devices with security fuses blown, so leave it
> > > assigned to the remote on shutdown and recover it on a subsequent boot.
> > >
> > > Fixes: 6c5a9dc2481b ("remoteproc: qcom: Make secure world call for mem ownership switch")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> >
> > Excellent.  This addresses the issue I was seeing with the Lenovo Miix 630
> >
>
> Sweet!
>
> > Reviewed-by: Jeffrey Hugo<jeffrey.l.hugo@gmail.com>
> > Tested-by: Jeffrey Hugo<jeffrey.l.hugo@gmail.com>
>
> Thanks!

As we talked offline, it appears we both missed the crashdump
scenario, so please spin a v2 that reclaims the memory just before
trying to access it in the crashdump scenario.  I'll be happy to
re-review and re-test.
