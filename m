Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 11 Oct 2016 09:36:45 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 4/5] rpmsg: Driver for user space endpoint interface
Message-ID: <20161011163644.GS7509@tuxbot>
References: <1475900595-8375-1-git-send-email-bjorn.andersson@linaro.org>
 <1475900595-8375-4-git-send-email-bjorn.andersson@linaro.org>
 <1005047c-ef7c-ccd8-848c-4974f893c820@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1005047c-ef7c-ccd8-848c-4974f893c820@st.com>
To: loic pallardy <loic.pallardy@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, Marek Novak <marek.novak@nxp.com>, Matteo Sartori <matteo.sartori@t3lab.it>, Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 11 Oct 00:46 PDT 2016, loic pallardy wrote:
> On 10/08/2016 06:23 AM, Bjorn Andersson wrote:
[..]
> >diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
> >index ae9c9132cf76..5daf1209b77d 100644
> >--- a/drivers/rpmsg/Makefile
> >+++ b/drivers/rpmsg/Makefile
> >@@ -1,3 +1,3 @@
> >-obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
> >+obj-$(CONFIG_RPMSG)		+= rpmsg_core.o rpmsg_char.o
> Hi Bjorn,
> 
> Could you please create a dedicated Kconfig entry for this new interface?
> This should be an option like i2C_dev.
> 

No problem, I'll do that.

Regards,
Bjorn
