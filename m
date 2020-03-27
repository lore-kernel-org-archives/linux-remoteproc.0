Return-Path: <natechancellor@gmail.com>
Return-Path: <natechancellor@gmail.com>
Date: Fri, 27 Mar 2020 11:50:55 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Build failure in omap_remoteproc due to 02e6d546e3bd
Message-ID: <20200327185055.GA22438@ubuntu-m2-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi all,

Apologies if this has already been reported, I did not see anything in
the archives. On next-20200327, I see the following build error:

drivers/remoteproc/omap_remoteproc.c:174:44: error: too many arguments
to function call, expected 2, have 3
        timer->timer_ops->set_load(timer->odt, 0, 0);
        ~~~~~~~~~~~~~~~~~~~~~~~~~~                ^
1 error generated.

This is due to commit 02e6d546e3bd ("clocksource/drivers/timer-ti-dm:
Enable autoreload in set_pwm") in the clockevents tree interacting with
commit e28edc571925 ("remoteproc/omap: Request a timer(s) for remoteproc
usage") from the rpmsg tree.

Something like the diff below should resolve it but it cannot be applied
to the rpmsg tree because it does not have the clockevents change. It
will have to be applied by Linus as a merge fixup.

Stephen, would you mind applying this to whichever merge happens second?

Cheers,
Nathan

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index cdb546f7232e..6955fab0a78b 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -171,7 +171,7 @@ static int omap_rproc_request_timer(struct device *dev, struct device_node *np,
 	}
 
 	/* clean counter, remoteproc code will set the value */
-	timer->timer_ops->set_load(timer->odt, 0, 0);
+	timer->timer_ops->set_load(timer->odt, 0);
 
 	return 0;
 }
