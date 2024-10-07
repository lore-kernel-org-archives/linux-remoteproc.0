Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA581D2B35;
	Mon,  7 Oct 2024 13:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728307490; cv=none; b=t2G1FTkQpo6+ok+/l6kT4OHjhsiyKqGEZYtGMwOit3DGq4zqx1yBQXEZaKCTywf/Rm/5Jhr83x6bV76qSKD4zFbY/xB52gj5ePpkHad+H9j95pfxxQzuZCNbgcJCTg3zwzV3nMYd404TPfZfeUnTcB+ad+sjNp1HJKp9S/Gr4jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728307490; c=relaxed/simple;
	bh=kOcohVWj9jo2graehXJSHjJ51Txxdp1oLXu2XXgJ5ws=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uaT2DCHTp0li37eECw20M+kPYjcEafMw7Ni4LWWOL+Ndj4T788GpIaZ4BfFKFnceKxDY+XL0DEUw8u+ltBNm0pl1RbCd073uBpUaGtaf0RiF4sIbOweD7Ht6OhO8YEX+Z2xl5G4bU8g2PS0o/32rLwgizjE3eupD4MkFAPQYe6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjrLWIKp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjrLWIKp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDD0C4CEC6;
	Mon,  7 Oct 2024 13:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728307490;
	bh=kOcohVWj9jo2graehXJSHjJ51Txxdp1oLXu2XXgJ5ws=;
	h=From:To:Cc:Subject:Date:From;
	b=YjrLWIKpoLu5xL5iVGelS5WGWR01oSpsuocA3gv0d44nv3iw30SWVauWJDuGdgWll
	 92s+0pRfoKcqD/frKb6Si4EbjwhPRbzJu8OepoLDNzYqU+YwY4gKDUGsZeBv8I8lXT
	 B8J/FOtYrb/qGCmbacKaGUyLwsNbMpjRSBul/1UmUOUThvV7G7exQt8SUFWEW/ecN9
	 odt+M6fyNls7nU0TJxuJqsxGKGXGA90dS9GCYRn5Fuxe1qiZPvJPT369BaBl9scpc5
	 YctOIAfa+pxRvlg5a9Ct/Mz/QXmaKOWWWGoRS571XqP+6CUtjj0s8UOZ+2R62sX9BK
	 NEYQXnhXSuKNQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Andrew Davis <afd@ti.com>,
	Martyn Welch <martyn.welch@collabora.com>,
	Hari Nagalla <hnagalla@ti.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mailbox, remoteproc: k3-m4+: fix compile testing
Date: Mon,  7 Oct 2024 13:23:57 +0000
Message-Id: <20241007132441.2732215-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The k3-m4 remoteproc driver was merged with incorrect dependencies.
Despite multiple people trying to fix this, the version 6.12-rc2
remains broken and causes a build failure with CONFIG_TI_SCI_PROTOCOL=m
when the driver is built-in.

arm-linux-gnueabi-ld: drivers/remoteproc/ti_k3_m4_remoteproc.o: in function `k3_m4_rproc_probe':
ti_k3_m4_remoteproc.c:(.text.k3_m4_rproc_probe+0x76): undefined reference to `devm_ti_sci_get_by_phandle'

Fix the dependency again to make it work in all configurations.
The 'select OMAP2PLUS_MBOX' no longer matches what the other drivers
dependencies. The link failure can be avoided with a simple 'depends
do, so turn that into the same 'depends' to ensure we get no circular
on TI_SCI_PROTOCOL', but the extra COMPILE_TEST alternative is what
we use elsehwere. On the other hand, building for OMAP2PLUS makes
no sense since the hardware only exists on K3.

Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
Fixes: ba0c0cb56f22 ("remoteproc: k3-m4: use the proper dependencies")
Fixes: 54595f2807d2 ("mailbox, remoteproc: omap2+: fix compile testing")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 955e4e38477e..62f8548fb46a 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -341,9 +341,9 @@ config TI_K3_DSP_REMOTEPROC
 
 config TI_K3_M4_REMOTEPROC
 	tristate "TI K3 M4 remoteproc support"
-	depends on ARCH_OMAP2PLUS || ARCH_K3
-	select MAILBOX
-	select OMAP2PLUS_MBOX
+	depends on ARCH_K3 || COMPILE_TEST
+	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
+	depends on OMAP2PLUS_MBOX
 	help
 	  Say m here to support TI's M4 remote processor subsystems
 	  on various TI K3 family of SoCs through the remote processor
-- 
2.39.2

