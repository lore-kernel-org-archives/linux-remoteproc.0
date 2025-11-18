Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6F9326927
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Nov 2025 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480496; cv=none; b=hV781TpzB8yugem/aKXT5iqqo9uqnyBjLQLpOWKZNHnlrDdwQO4bt5NcD+mNz3BRNXoxetslPBhNen93DXn+0iugI0UAbyYm4xrTJS4AxyFaUgNneBLYeRi9uhJHgznFXanPz3LwebMrrjykTntGFVrEq73IdFejNfoUVVTiPjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480496; c=relaxed/simple;
	bh=4FYEzvEsHaBRhjFeyJptLUbOYvkVKXyIKaNK9OpeqGE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MFUFDFfVl4fP4LtKzTvH4dAFKFQ2CpqUbvYIWKa7nkTJyUBfxr3R3ls4rYlMU+FQgcpL81jZxbnRz/rGLQtTSh+MsIeRERtg7C6LY6q1mqAJtYGEeBEic/MufRZTwB6Y5moo++u0KqPzm7ffVCvG5oWm8QBJqfhj6qO1LcfE74w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pZi6SeoW; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pZi6SeoW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763480482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LnpVr7zaSd93W3V6jzoJKyZyWWTxXChALOEJTnB7HSw=;
	b=pZi6SeoW+ZRy/Ng2D20K7U4IYdTx2skhM6ZeJJWGupzdZ83eM3NJR40NgZF+tOGJaMChFQ
	ysLflX3bhwkgCMmswY1yDdYm1D7zR+FrnklDkDpivuclVW8D1cNjAi4RanSzyhIAHqiIrh
	U/VulEf+Pwr4PE7HDttemdYr1aJbTBs=
From: Dawei Li <dawei.li@linux.dev>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com
Subject: [PATCH v4 0/3] Fixes and rework of rpmsg_eptdev_add()
Date: Tue, 18 Nov 2025 23:41:04 +0800
Message-Id: <20251118154107.3100-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This is V4 of series fixing fallout introduced by anonymous inode eptdev
code and rework the exception handing paths. 

And it tries to address a long suffering issue related to WARN() in
error path.

Change for v4:
- Re-layout the patches in series
  1/3: Fix potential WARN In error patch of rpmsg_eptdev_add().
  2/3: Rework exception handling of rpmsg_eptdev_add() and callers.
  3/3: Merge branches in rpmsg_eptdev_add().
Link to v3:
https://lore.kernel.org/all/20251113153909.3789-1-dawei.li@linux.dev/

Change for v3:
- Split it into 3 patches:
  1/3: Fix legacy bug.
  2/3: Fix new bug introduced by anonymous eptdev code.
  3/3: Rework error handling code.
Link to v2:
https://lore.kernel.org/all/20251112150108.49017-1-dawei.li@linux.dev/

Change for v2:
- Add put_device() when __rpmsg_eptdev_open() failed.
Link to v1:
https://lore.kernel.org/all/20251112142813.33708-1-dawei.li@linux.dev/

Dawei Li (3):
  rpmsg: char: Fix WARN() in error path of rpmsg_eptdev_add()
  rpmsg: char: Rework of rpmsg_eptdev_add() and its callers
  rpmsg: char: Merge cdev branches in rpmsg_eptdev_add()

 drivers/rpmsg/rpmsg_char.c | 60 ++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 29 deletions(-)

-- 
2.25.1

