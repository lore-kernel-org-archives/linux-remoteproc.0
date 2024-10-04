Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2521814A095
	for <linux-remoteproc@vger.kernel.org>; Fri,  4 Oct 2024 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034911; cv=none; b=BB1JVDrhDpvONm8hBNrkJbPkeqTFlB5Twgdsdm9wqPRRDm+JV+wZs2ZH5rBKQdr2e/bgWfekjEEXYoH5Cl33tUD6tZvo/JAs+lgcaPZG5m80zdVs4R94e/tbJuLZVF9UnUcqVMtgN7k2nVXC9mYgSbRgWJjxrRJeytWPchYpzLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034911; c=relaxed/simple;
	bh=tBZwnCstJl4XjC8fDY0I4EZomyUDHSeE+mIn5eF+YD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KbRMIsYGMqbeyJfPSu7DM2ibKoFVzb6JkCrX02oH+S1rHImKTMWXp9H06Qxe3hdqOYcV6ERjda3vBcNSq3Dn8N63rQY30K33XM+oPGtB8n2XpGyKp3/iuYoNyBJdid1uUKTUPvf2iAXGF7Vfk209UShu7Z6ckPsQGZ/bGAJ+z0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UiZFQ23U; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UiZFQ23U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034910; x=1759570910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tBZwnCstJl4XjC8fDY0I4EZomyUDHSeE+mIn5eF+YD8=;
  b=UiZFQ23UaiyZLIcXrZaEQORQ9hy0f8io5cVFT19calLSwxGrtktRDpBx
   ee4BVig4zVroP+Si615gXP0xSs959kIX6goxYVoKwz0uCalFY95JiQkeX
   umOZ8YoYR9jdsJ+1BeM3/9vZrmt2bu6lA+sWl6jcqkNsrWBVY0uH1Lyj9
   J+oMgX2DKRjjITVljXdZNsMBlZv2TCHmb8zCQ4EqufZdNJTwAEVPhoeuj
   jLK6arMns4rVy3xvu85xf6MC0o8qeajtJaLcI0SHYx43JGRkCQMz68Qy/
   ITgZhEwqaYRnFA+qTyO0ETCR6mAGhPRZ2F7ApXPPv95qOjwpCLzKm4PmL
   g==;
X-CSE-ConnectionGUID: Og924LElQwGH4BosP/Fdng==
X-CSE-MsgGUID: 08B9bds9SzmzVaTLdsA4FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27136189"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27136189"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:48 -0700
X-CSE-ConnectionGUID: 9aRRgvdGSau7gkNjQotcEg==
X-CSE-MsgGUID: nQomzGetQV6PVT3V6Rr41w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105492073"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A586211F7E7;
	Fri,  4 Oct 2024 12:41:44 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoi-000Tet-29;
	Fri, 04 Oct 2024 12:41:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
Subject: [PATCH 38/51] remoteproc: omap: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:44 +0300
Message-Id: <20241004094144.113997-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/remoteproc/omap_remoteproc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 9ae2e831456d..e8f0e915ca3f 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -552,7 +552,7 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
 			ret);
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 }
 
 /**
@@ -653,7 +653,7 @@ static int omap_rproc_start(struct rproc *rproc)
 	pm_runtime_get_noresume(dev);
 	pm_runtime_enable(dev);
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
@@ -711,7 +711,7 @@ static int omap_rproc_stop(struct rproc *rproc)
 out:
 	/* schedule the next auto-suspend */
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 	return ret;
 }
 
-- 
2.39.5

