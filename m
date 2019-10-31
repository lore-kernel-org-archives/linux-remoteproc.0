Return-Path: <jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
References: <20191031184632.2938295-1-bjorn.andersson@linaro.org> <20191031184632.2938295-3-bjorn.andersson@linaro.org>
In-Reply-To: <20191031184632.2938295-3-bjorn.andersson@linaro.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Thu, 31 Oct 2019 16:03:32 -0600
Message-ID: <CAOCk7No0D2qyg-HFEcy_aog9eYOP2oSBPeVVfDAJ_90RCs=b1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Validate each segment
 during loading
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, MSM <linux-arm-msm@vger.kernel.org>, linux-remoteproc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Oct 31, 2019 at 12:48 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The code used to sync with the MBA after each segment loaded and this is
> still what's done downstream. So reduce the delta towards downstream by
> switching to a model where the content is iteratively validated.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Seems to be just fine on the Lenovo Miix 630

Reviewed-by: Jeffrey Hugo<jeffrey.l.hugo@gmail.com>
Tested-by: Jeffrey Hugo<jeffrey.l.hugo@gmail.com>
