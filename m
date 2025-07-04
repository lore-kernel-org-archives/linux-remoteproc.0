Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE75A2F0C6A;
	Fri,  4 Jul 2025 07:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615700; cv=none; b=WnfqhJlflh++e21QPQl4N5iFzrId69CEHZiecEbYf6+GfkzSEip6yD7IOXK04FZnbgyty0yXWpx2nul0ukoud15eGMAOEn5OC7b1Cup9OH+xGUr9ohLyUCsFHHtOZRiHF849IuWEoN8MKAxYaPel8xr+T5PJvqUpoJngXipKArI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615700; c=relaxed/simple;
	bh=sfK9WpzhPRbPFgvJ0XGyiFlzwl0+Go4GT4lb4zAknlI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CN4yKoSMxrZO1sRvFGyiLwqtsKV8cCxB1EEjfPzNmgG6qahxhuKYf0o3zDI1RyxLplPH/SkhlT6Ve5cpf4JNE8OXdklxJYyMXhE2xaOoGqNWovftIKf7BiaNjuk1gy9SJhpWgkocXY7DdxEdvgU62IQIFnm4GvtwvaRk6KlmNN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlN70D5h; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlN70D5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615697; x=1783151697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sfK9WpzhPRbPFgvJ0XGyiFlzwl0+Go4GT4lb4zAknlI=;
  b=FlN70D5hE68HTNl2sD+7JrwIEjPgm1grZ3bTu3XEItRg30pDyvbuWrdD
   pNfdDncjuOBi7fQOPmAk6ltW0ujAHuS0589d4MBYwG+PQGo7HgHfGbvu8
   bonnNsE7XCoYd3j1q5BFmVwxDIiaFpYdfkZwE1q0EIkq9FNVBxq21Mgwm
   nLm2S6V6yt+FlGaEtim8nbBzbdU9PrJ00xGGSQnF0G7PRqoYA4HT5k5mE
   zwHOZ84XDlHuBOXOUHhZKukRnlFADvqXtU3naFLU2ACzAfWAfamHID2d/
   LLpkXZsVhvRNWP/qslU9eRtcnDumRsADTMgRjCVkfvGX7vX8seVjc4RsJ
   w==;
X-CSE-ConnectionGUID: x9uO1LShSimJf9Ra3wOUJw==
X-CSE-MsgGUID: wy+3eaNST6CScU6Iqix1Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194235"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194235"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:49 -0700
X-CSE-ConnectionGUID: e3O9hWJCT9i44Ftg8XOlgg==
X-CSE-MsgGUID: GHWntWe8QAyofpx7RTUv9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616627"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:47 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 77FD044433;
	Fri,  4 Jul 2025 10:54:45 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 58/80] remoteproc: omap: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:45 +0300
Message-Id: <20250704075445.3221481-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/remoteproc/omap_remoteproc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 9c9e9c3cf378..cb01354248af 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -555,7 +555,6 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
 		dev_err(dev, "failed to send mailbox message, status = %d\n",
 			ret);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
 
@@ -656,7 +655,6 @@ static int omap_rproc_start(struct rproc *rproc)
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_get_noresume(dev);
 	pm_runtime_enable(dev);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -714,7 +712,6 @@ static int omap_rproc_stop(struct rproc *rproc)
 	reset_control_deassert(oproc->reset);
 out:
 	/* schedule the next auto-suspend */
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 	return ret;
 }
-- 
2.39.5

