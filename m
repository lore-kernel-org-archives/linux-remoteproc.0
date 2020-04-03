Return-Path: <torvalds@linuxfoundation.org>
Return-Path: <torvalds@linuxfoundation.org>
MIME-Version: 1.0
References: <20200402010812.GA751391@yoga> <20200403013134.11407-1-natechancellor@gmail.com>
In-Reply-To: <20200403013134.11407-1-natechancellor@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 Apr 2020 10:48:06 -0700
Message-ID: <CAHk-=whG84d5bGHU5HLOMgR59BqUcuawPTxGgVDm3JWiWJHi6A@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/omap: Fix set_load call in omap_rproc_request_timer
Content-Type: text/plain; charset="UTF-8"
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Apr 2, 2020 at 6:32 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> This is due to commit 02e6d546e3bd ("clocksource/drivers/timer-ti-dm:
> Enable autoreload in set_pwm") in the clockevents tree interacting with
> commit e28edc571925 ("remoteproc/omap: Request a timer(s) for remoteproc
> usage") from the rpmsg tree.
>
> This should have been fixed during the merge of the remoteproc tree
> since it happened after the clockevents tree merge; however, it does not
> look like my email was noticed by either maintainer and I did not pay
> attention when the pull was sent since I was on CC.

Thanks, I've taken this patch directly into my tree since it was my
merge that screwed up.

                   Linus
