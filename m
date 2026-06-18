Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CB930C153
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781800476; cv=none; b=t/EFDrfvyYA9yFaYMSE4HcQ9fgQtQdYMYMK63OumnBYbOieBHkpx+cvR6uX1l56eWyzxRvSQM+TEnctEVbBjV13o+gTWQXiC/5D1VoJB5tYnmRTs9RwFmnSwE2ZERaIfTHvnxgMf98kCZ97me/ylnFUrlIU6C0YGce6hFVhL4+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781800476; c=relaxed/simple;
	bh=XaUFrkaDUPLjYJ5ELzkWt5LI/tfyJM9gnOeguRGE1mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hFueoOya1ScBbSluhipbFcLRmMr+bUjOo95g68frZSZVPEGhrpt+S0A+Bril5uF6cIGBuG+mUAW4rbmD7+V2s4CChM7QFKfLlostSeFY2wCZ1Z8EqhjR7QN7wOKRF6QWEgY/JoP1GOwF6HdxZqvn7CNfHLmDnLynNVLcEo+h6zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=buOPqY6q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="buOPqY6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=jCtoIhGictYg0G
	JbVACR9a59PI/t13tB+ngu3j5/8gs=; b=buOPqY6qApO8mrr50VGvtlWSMDnwXb
	mAD0RWTLU3IzoIAq+Z8y67KnB+eU5GRADDMiOU/HB1RghEbXlcN5hJ5xK7GMDo2R
	kOOBYnpcltMpimD5gjIylF3wSkueA51HmdSiHnJbDFDp6tLax3ArI+LnhgOVogYj
	m5hYBACCj2u78YikYMYrXgxy8WxVtY7vSSMC81qebT1b4zoOmY9PlOZs1Y2xQtdh
	75WU8Uyqs+yeV4d1U5vNNklJr+aaYh5tTYTFrFRJB6DF1zjfZZ4MwNqJOhjP0ncT
	PK+luKATrgdLYr72RzPWqlsTwVPkZ8I6lXBsUOSpiGM9Zm/EeGnwbNxA==
Received: (qmail 638204 invoked from network); 18 Jun 2026 18:34:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jun 2026 18:34:26 +0200
X-UD-Smtp-Session: l3s3148p1@rzHZv4lUNL8ujnsq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 0/2] hwspinlock: add summary in debugfs
Date: Thu, 18 Jun 2026 18:34:20 +0200
Message-ID: <20260618163422.17604-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renesas R-Car SoCs have their spinlocks inside a unit called MFIS. Up to
R-Car Gen4, there was only one MFIS unit on the SoC. Gen5, though, has
multiple instances and, thus, multiple spinlock providers. The spinlocks
are meant for specific cases (AP<->AP, AP<->RT, AP<->SCP...). For
development on these systems, it is helpful to have an overview of
registered spinlocks in debugfs. This series adds support for that. One
preparational patch, and one patch with the desired functionality.

A branch for testing is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/mfis/hwspinlock

It has been tested on a SparrowHawk board (R-Car V4H) and an Ironhide
board (R-Car X5H).

Looking forward to comments.

Wolfram Sang (2):
  hwspinlock: reverse logic for used channels
  hwspinlock: add summary in debugfs

 drivers/hwspinlock/hwspinlock_core.c | 110 +++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 15 deletions(-)

-- 
2.51.0

