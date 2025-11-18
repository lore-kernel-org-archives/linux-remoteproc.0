Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664EB3659E8
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Nov 2025 15:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480525; cv=none; b=VMg9fl0SehwLdMEwEuIWqqZHIqDlvRSjTR7hgi8vjnUl8Echj1PexF1P5hGUwRXrgKtRg8XKpswmz9sAt0hkYObVHqmEoqg5uZPixqbHkHFxc2/sCyt0KuykuaPfWa/G9avUx1oy1bOVmfVJydclNN5+H2JnHpyrZy1lsEDpV+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480525; c=relaxed/simple;
	bh=p7JmlZu7aX2oza+mhHmm837atoJM0dG3uJyoPzvTEUo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dLIAGUiyP9/qmEBQ4LsXHV5/bQi2KVdA2R0tj8Zq7z9jtayMGZOGdWzC0XD/VHiZSFCWNP8P+G3oAlXSPLeiiBarolTvAMnG3O3qzqwcKtdf5aWiAUb1V6u3TNUPekNWTAKLJhk3tLkTtIvaQ7TVPFkiAkgnyQaOFcGRAq53IUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qfxmlxwJ; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qfxmlxwJ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763480520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMBn6kpg/KtrTcaUg3wwySbqhmE37Z6eHvYm9uflh8s=;
	b=qfxmlxwJchfijDosgAxIMu1GLpjHS0tXWsShr2fsy5DlZLEBfjn6Kb+15H6VMlZwin1TFI
	6cZboYNBhCUeKaM9k5fKvWhTQ/7pV+ndvAN/URlH28/HWm+8xLhmMG+dLiZVMzA9VI0UJi
	uxTx3N/YsZFYfZDgOJlrh2sxszq3LSM=
From: Dawei Li <dawei.li@linux.dev>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com
Subject: [PATCH v4 3/3] rpmsg: char: Merge cdev branches in rpmsg_eptdev_add()
Date: Tue, 18 Nov 2025 23:41:07 +0800
Message-Id: <20251118154107.3100-4-dawei.li@linux.dev>
In-Reply-To: <20251118154107.3100-1-dawei.li@linux.dev>
References: <20251118154107.3100-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

There are two if(cdev) branches in rpmsg_eptdev_add(), merge them. Note
that cdev_device_add() still must be last one since dev->release()
doesn't reclaim cdev related resource.

Signed-off-by: Dawei Li <dawei.li@linux.dev>
---
 drivers/rpmsg/rpmsg_char.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 56371899212f..505411029fe0 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -467,14 +467,6 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
 
 	eptdev->chinfo = chinfo;
 
-	if (cdev) {
-		ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
-		if (ret < 0)
-			return ret;
-
-		dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
-	}
-
 	/* Anonymous inode device still need device name for dev_err() and friends */
 	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
 	if (ret < 0)
@@ -485,6 +477,12 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
 	ret = 0;
 
 	if (cdev) {
+		ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
+		if (ret < 0)
+			return ret;
+
+		dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
+
 		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
 	}
 
-- 
2.25.1

