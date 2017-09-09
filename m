Return-Path: <linus971@gmail.com>
MIME-Version: 1.0
Sender: linus971@gmail.com
In-Reply-To: <20170908213904.GJ20643@builder>
References: <20170908213904.GJ20643@builder>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 9 Sep 2017 14:34:22 -0700
Message-ID: <CA+55aFwAWW7rKjV8OsKAt_vW22HkuME1wb2LE3Qw-5D4V1U+xA@mail.gmail.com>
Subject: Re: [GIT PULL] remoteproc updates for v4.14
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>, Oleksij Rempel <o.rempel@pengutronix.de>, Bhumika Goyal <bhumirks@gmail.com>, Himanshu Jha <himanshujha199640@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Sep 8, 2017 at 2:39 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The arising conflict is very trivial; both changes should be included in
> full and the "menu" should encapsulate QCOM_GLINK_SSR. Can you resolve
> this as you're applying the later of the two pull requests?

I haven't seen the arm-soc pull request yet, but I'll try to remember when I do.

But if it ends up being a real data conflict (as opposed to a silent
semantic conflict - and it sounds like it will be) I'm sure I'll
remember when I see it.

                 Linus
