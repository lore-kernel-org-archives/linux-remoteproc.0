Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AAA219E4;
	Fri, 21 Jun 2024 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982072; cv=none; b=MCeEwa83D+A4R+IhUybmlxxBzumzFKIlnHEINZv9WRfH9HTx/ng1EYHeJeiNgl2WSDXpVF2OCsVHepa+QkLVdN6A2D30My73lwP8UeRJNjIhfHRb0KVaY7hvRrv9BbIr76wFlbFvpvcxwY1n82gWArK4duRtSh+R+ugsYHVgv10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982072; c=relaxed/simple;
	bh=CFh9aULfeqz+NL05X0buLtq0+cpjyXx2edoY02SlRaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dRFoS6E+XlgCOIlFX/0MxjGeTkVpdFt369GFHW36T7tmZqigDAnHSBawXPYTU9gU1Zk4T2nmvl0/YdFeJSr1PzdZrg4mzIq+RW/VPaxEoUdhbXmVVFlG5XvAy7737BTXyBvBKZVPt1lfqqbH4oFqgosSkNm3TAYWL22GbixfU40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ezgCZs9F; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ezgCZs9F"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 626FD24000C;
	Fri, 21 Jun 2024 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718982067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QpGVGvlpLYiV9Z8Aj4NgY3t791MGlzTEcGcHPYC7k8s=;
	b=ezgCZs9F0wtKLZ4BG1BTBmRIUr9oqjs+RE9lFN/bPGpS5Cgq+4Q3VlqDu9SJlynIuN8boN
	g2LG6vKVIJohhqOZBpKONXepP/RUIV8LtT6S6uN0+okrZrU9o4rTsmkSWSny16EvXp1bbv
	+JrqElz6KJwNG5wPqqts6TgPh4BlNe+igkY/8KoIvpzoI2PAqRcWRNWlkc8sp5E71u2pyK
	CqHlaqcBRITteDYgW5TLQnnHqt2Gn5O7hiz/uyFux2VyFglNIXrXCxZuUZtuytygyXemBq
	ixSfsBqEf7s0L7NdYCUbZ3Njd+LL9DKiTAqU/nTPNGjpv/+y0J0rrhQVOJNxyw==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Suman Anna <s-anna@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Hari Nagalla <hnagalla@ti.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 0/4] remoteproc: k3-r5: Introduce suspend to ram support
Date: Fri, 21 Jun 2024 17:00:54 +0200
Message-ID: <20240621150058.319524-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com

This series enables the suspend to ram with R5F remote processors on TI K3
platform.

The 1st patch is actually a fix, independent from the others

The 2nd patch introduces the suspend/resume handlers.
On suspend, the running rprocs will be stopped (or detached) and then
re-loaded in resume.
The logic behind this is:
 - shutdown the cores that Linux started to save power in suspend.
 - detach the cores that were started before Linux.

Then, the 3rd and 4th patches introduce the graceful shutdown of remote
procs. This will give them a chance to release resources and shut down
in a civilized manner.

Without this series, the suspend fails with:

omap-mailbox 31f81000.mailbox: fifo 1 has unexpected unread messages
omap-mailbox 31f81000.mailbox: PM: dpm_run_callback(): platform_pm_suspend returns -16
omap-mailbox 31f81000.mailbox: PM: platform_pm_suspend returned -16 after 16328 usecs
omap-mailbox 31f81000.mailbox: PM: failed to suspend: error -16

Patches 2 and 4 are based on work from Hari Nagalla <hnagalla@ti.com>.

@Hari, please feel free to add your Co-developed-by:/Signed-off-by:

Tested on J7200X SoM
Series is based on v6.10-rc4

Richard Genoud (4):
  remoteproc: k3-r5: Fix IPC-only mode detection
  remoteproc: k3-r5: Introduce PM suspend/resume handlers
  remoteproc: k3-r5: k3_r5_rproc_stop: code reorder
  remoteproc: k3-r5: support for graceful stop of remote cores

 drivers/remoteproc/omap_remoteproc.h     |   9 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 196 +++++++++++++++++++++--
 2 files changed, 188 insertions(+), 17 deletions(-)

