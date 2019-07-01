Return-Path: <jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
References: <20190622012146.19719-1-bjorn.andersson@linaro.org> <20190622012146.19719-3-bjorn.andersson@linaro.org>
In-Reply-To: <20190622012146.19719-3-bjorn.andersson@linaro.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 1 Jul 2019 08:39:57 -0600
Message-ID: <CAOCk7NqwYz9OdYfKHJKet4AQFN7a68ussJi6Z3Aq4B_-za1K6w@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: qcom: q6v5-mss: Support loading non-split images
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Sibi Sankar <sibis@codeaurora.org>, MSM <linux-arm-msm@vger.kernel.org>, linux-remoteproc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Jun 21, 2019 at 7:22 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> In some software releases the firmware images are not split up with each
> loadable segment in it's own file. Check the size of the loaded firmware
> to see if it still contains each segment to be loaded, before falling
> back to the split-out segments.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
