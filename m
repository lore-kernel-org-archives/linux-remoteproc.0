Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAD41CB339
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Sep 2024 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623274; cv=none; b=CaJrRcay3q/bNAp3RO8Sa3j52S8bTDMMzF/HhIpH1ptyx8KYRgPKY2ovgOEfZLA9IB1+Ku3kfeZ7FFGU2PUUNpMmQEgPC8L17XA/U6cbyFCyKAkhqiixohfoWI0r/l9K4WgljRFqajSFVvwqTo5WsCXD9hR18d9GZH2wdgaajzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623274; c=relaxed/simple;
	bh=irbJ6+4leemWXiT2T81qQWP8gmZewVhPXzdI+7p2LqA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YjifAA0tco8Zhq7PaXxEtG9NkxhfZxWJA3+asi6qWg0epsOq7vWtbsuBf7W6aJkWeLG9dzOPObT6hMeAtUUKW7p1D8B5UAIXwhzR4W4B64pg+igiTAunTMJjxi/MrMfSIAirAkOb+D7kYfhE+erlilJpIQAOq3iZcdgfN19B4TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4X0ZDP5K2Cz1xx1V;
	Fri,  6 Sep 2024 19:45:41 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 68FB91402DE;
	Fri,  6 Sep 2024 19:47:43 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Sep
 2024 19:47:42 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <patrice.chotard@foss.st.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH v2 0/3] Simplify with devm_platform_ioremap_resource_byname()
Date: Fri, 6 Sep 2024 19:34:02 +0800
Message-ID: <20240906113405.92782-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf500003.china.huawei.com (7.202.181.241)

Use devm_platform_ioremap_resource_byname() to simplify code logic.
No functional change here.

v2: Add other cleanups in the remoteproc subsystem

Zhang Zekun (3):
  remoteproc: Use devm_platform_ioremap_resource_byname() helper
    function
  remoteproc: da8xx: Simplify with
    devm_platform_ioremap_resource_byname()
  remoteporc: ingenic: Simplify with
    devm_platform_ioremap_resource_byname()

 drivers/remoteproc/da8xx_remoteproc.c | 10 ++--------
 drivers/remoteproc/ingenic_rproc.c    |  3 +--
 drivers/remoteproc/st_slim_rproc.c    |  6 ++----
 3 files changed, 5 insertions(+), 14 deletions(-)

-- 
2.17.1

