Return-Path: <natechancellor@gmail.com>
Return-Path: <natechancellor@gmail.com>
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] remoteproc/omap: Fix set_load call in omap_rproc_request_timer
Date: Thu,  2 Apr 2020 18:31:35 -0700
Message-Id: <20200403013134.11407-1-natechancellor@gmail.com>
In-Reply-To: <20200402010812.GA751391@yoga>
References: <20200402010812.GA751391@yoga>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

When building arm allyesconfig:

drivers/remoteproc/omap_remoteproc.c:174:44: error: too many arguments
to function call, expected 2, have 3
        timer->timer_ops->set_load(timer->odt, 0, 0);
        ~~~~~~~~~~~~~~~~~~~~~~~~~~                ^
1 error generated.

This is due to commit 02e6d546e3bd ("clocksource/drivers/timer-ti-dm:
Enable autoreload in set_pwm") in the clockevents tree interacting with
commit e28edc571925 ("remoteproc/omap: Request a timer(s) for remoteproc
usage") from the rpmsg tree.

This should have been fixed during the merge of the remoteproc tree
since it happened after the clockevents tree merge; however, it does not
look like my email was noticed by either maintainer and I did not pay
attention when the pull was sent since I was on CC.

Fixes: c6570114316f ("Merge tag 'rproc-v5.7' of git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc")
Link: https://lore.kernel.org/lkml/20200327185055.GA22438@ubuntu-m2-xlarge-x86/
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/remoteproc/omap_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.26.0
