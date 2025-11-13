Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EB73502A1
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 15:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048401; cv=none; b=eD31KHUinSGOXn20nJd8jpj7ZDNJMIbctqBE6Q188dOoaLMuUNSv/E4P7pxUr8nfOxAHvc9LuTgqhH36oI0148m73VpMRAIk/Gtwp6yw/0VtyjnXmVAxzTaY9xOklMitna2i+dc7gPmHTMaT2UHljQYsQ14QYB5ei6r7DBVVkPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048401; c=relaxed/simple;
	bh=k/3j30RiPjrV6HchzSgQ0ZjsE+rLhctlRzqsQqGONOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QSxKFBwJ1Za+qB6y3n+V6cMM/nkcTJEAGriRHYa2aXJEqA1iD8Xgjt9waB+pVANqIvd1QZuq484ZZ3YX8tvWCUCCf0h8V0LCeLxQLlqkOHSZf6PbCygBrx4cMCqMUyFPnQ1U/wiN70dZVEiJRUrIA4nrqOAhv1XIc2xvKo9Txa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BZeapJhh; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BZeapJhh"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763048398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vtlmeFphp/i7U8mLzlyr4l2G6yo0wDJjtrAydxQNNXs=;
	b=BZeapJhh6cQANvQ3/4cMS19q29SXv1zzRtGPssvm/Y/XVy/8G5fYPfE7RCTKwpjycejS4v
	VQXxjfT/v2bx3ivBAH4bZFNXTabJbXdDOaNJlhxy3XZF0yyI7whZbDLQkLWZoaBs2cjpf0
	cbpCN87ZRM9IaPeaCPczeSxAbYyn5mQ=
From: Dawei Li <dawei.li@linux.dev>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3 2/3] rpmsg: char: Fix UAF and memory leak in rpmsg_anonymous_eptdev_create()
Date: Thu, 13 Nov 2025 23:39:08 +0800
Message-Id: <20251113153909.3789-3-dawei.li@linux.dev>
In-Reply-To: <20251113153909.3789-1-dawei.li@linux.dev>
References: <20251113153909.3789-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Potential UAF and memory leak exsit in exception handling paths for
rpmsg_anonymous_eptdev_create(), fix them.

- If rpmsg_add_eptdev() failes, eptdev is freed in it.
  Subsequent call of dev_err(&eptdev->device) triggers a UAF.
- If __rpmsg_eptdev_open() fails, eptdev is supposed to be freed by
  put_device().

Fixes: 2410558f5f11 ("rpmsg: char: Implement eptdev based on anonymous inode")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aPi6gPZE2_ztOjIW@stanley.mountain/
Signed-off-by: Dawei Li <dawei.li@linux.dev>
---
 drivers/rpmsg/rpmsg_char.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 1b8297b373f0..0919ad0a19df 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -494,6 +494,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
 	if (cdev)
 		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
 free_eptdev:
+	dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
 	kfree(eptdev);
 
 	return ret;
@@ -544,7 +545,6 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
 
 	ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
 	if (ret) {
-		dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
 		return ret;
 	}
 
@@ -560,6 +560,8 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
 
 	if (!ret)
 		*pfd = fd;
+	else
+		put_device(&eptdev->dev);
 
 	return ret;
 }
-- 
2.25.1

