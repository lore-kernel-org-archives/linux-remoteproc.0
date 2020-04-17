Return-Path: <johnstul.lkml@gmail.com>
MIME-Version: 1.0
References: <20200403175005.17130-1-elder@linaro.org>
In-Reply-To: <20200403175005.17130-1-elder@linaro.org>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 16 Apr 2020 22:51:24 -0700
Message-ID: <CANcMJZDH=3vU0pj+Az2YMJbTP7ku0dqhbR65DETmXM6Az0U=1A@mail.gmail.com>
Subject: Re: [PATCH 0/3] remoteproc: bug fixes
Content-Type: text/plain; charset="UTF-8"
To: Alex Elder <elder@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <agross@kernel.org>, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Apr 3, 2020 at 11:19 AM Alex Elder <elder@linaro.org> wrote:
>
> This series fixes some bugs in remoteproc error paths.  The last
> patch is derived from something I posted before, but has been
> updated to based on Linus' current master branch.
>

Oof. Apparently I didn't hit reply all but only sent my tested-by to
just Alex (now 10 days ago)

Tested-by: John Stultz <john.stultz@linaro.org>

This set resolves regressions we've seen with 5.7-rc1 on db845c, and
it would be really nice to see them land in 5.7-rc2.

thanks
-john
