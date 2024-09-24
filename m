Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6D31E481;
	Tue, 24 Sep 2024 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727181850; cv=none; b=be2EjVc/d/tGZKpgJvx5A1gnBdjcPGU1/cnJPgYh1pw0f0/VzIsnOgIlLYwWJ5gg6unReN3E5mdMTbgultaTCdsMCdmMnq3dBFk089i3yiqldwifMZmyn9HmQFN7LsDH/WJi++K3jOoniPKfdgdiEleSL67THt9bTSQc9fFRfRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727181850; c=relaxed/simple;
	bh=g9vt/2w7SEWJxQSVcRxVO46K7DIbg7DksvpeJS7dHIE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=VjU9Dhzv/r6H1/lj9w+JlHyX6Et7g1J4Dfo6xkrzMJTGnVP8w2p7aHBOqaiMD1kt1wsOSPeKFuIh6LLlCMWN9btr1dYvK7vod7QHOymrjFtYCnBvBxkt8qCGuSUBG6LR1uAaetnE1FyvVRogJ2ycYynJDJrWz0pGbP5TctIXdl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=heUhHXzI; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="heUhHXzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727181822; x=1727786622; i=markus.elfring@web.de;
	bh=7o6sioFTBBYjzQQBwfjItdoLdM3KgWHd2FeaOBEYDeQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=heUhHXzI6OsmPgArlFVdaqp+iWZxnO3m1nP/OSObCBm5ruQNlKOBhU1voS5S4yfg
	 YakL3iRK5F5NBntNTzxd3KicrIslqgUFIgYDDJViQE1bASQMKNRm0SscUdtAKWTs9
	 r3yx+uaWfljzZ/yB/SOs/g6ya6l+DLwDxFaEJyzG8xCigK7nSBksZwR4IqOGk5JdQ
	 vxh8w4OU6Ab8DjJ7DzgV509fY7dLr0vmOvt4kx8Bjqqrn9A+ecAUWhnj3TAMUhHjZ
	 9fpUxbwt8yuY7e/Qq4lGTReNS/Rq3j1UvJ1wl7gWo8KpBtLv8jpRcZFKf8HR2uGSe
	 v2tdtZTo7zCWL3qblw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MK56y-1seJ9s0GfW-00Y1gK; Tue, 24
 Sep 2024 14:43:42 +0200
Message-ID: <c46b06f9-72b1-420b-9dce-a392b982140e@web.de>
Date: Tue, 24 Sep 2024 14:43:40 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-remoteproc@vger.kernel.org, Andrew Davis <afd@ti.com>,
 Bjorn Andersson <andersson@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
 Martyn Welch <martyn.welch@collabora.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>,
 Wadim Egorov <w.egorov@phytec.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] remoteproc: k3: Call of_node_put(rmem_np) only once in three
 functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qV1ocPRQpkuZeqkfmXsWGeFETDwEIQUbXwkqd71XqSrIRvuHvWd
 eZreAJ6+eVCuDQdHOt0PDgjBlW+andyOhXg4EY4QNJy3rqiRrhsw//uvi7IjtGbP3pruSJs
 HS9mLvkMGxYGvel/RZRgxRZKHLqrGMQU79hgrwi7DIQNhGqvt1qxeNpnDOpiUxitC0YiEhE
 Mitv+WwqLtEERL3kEe8Pw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RWdOIv54GYo=;0A1LdlsKROlstTZjg3S5hU2RG+d
 q2U1MHZN6fKvXCgpSZrgzUW9QTQXQiB5ke6eAaDxgGdUp094DIdSc9rQymHLcjuC5S12qEZkH
 KbXuWd0k94hFN1LCOMeHnJnfEiY2VXvoewhjzBJH0sEkkaDMvQoBXrrGOe9lgKSw1A6EmCPOS
 blFXmHHsBT+BIj5GyhdzQOzGWbpT0FNe2DI+48WBTS5KjMNPQ2tiIXcsutG5KYZc5jnExrDPs
 DLarnFMjg6yZz6RZGox/1jwHmwJi7O1D36R9iNNb3IfOj2cxHOwJUaZN9v+9sDWrHq9rPuhH8
 QqOc9DLRGtfRPGZ/vvQnoHhx05ltED4lt39PvHn2LuWIOs2ZUsSpuLrvxbdsRQ7WX8EN5Emmy
 hErGiNnDbED2F43+VhWry6H9jhljDlZ/o1/FKgr2JQe8K5S8L7QpdSOA1S7WgfGNSShG4DVR8
 h7LnvzkUQjCyxmareY9VCThZRw5LWcJGTHtq7zgfDYx8BgJ8w1RBSRkJcNRXGmn8hmTYoWJza
 U4O0itUeSJbwP4wnrvxr3/WHNckjXK8JMmKRJnQqVDjswS77ZA2PCtX99OptdQnNzAMdCUCI0
 iHmUJCUNuuGqj1/+p9R8Ta0pouM4aPh4L//4hEKuTGunJsUUod+8umCZGvuVOS8PG56vMR6ic
 /DadwHJPFCuvM+eDKs3KofbnJzDE4JMutYmfw79vgUvM8qe4mkREY9WrMkKOmIUP6i8216yUx
 PLpcaEZJSOoa29LMr5K4Sz+TbO1kxnI6AgEsJV3yTACaPN7AcAlKD8945EpgC63BdGgSJOjKE
 Qbg9AAibxgQtx8fzOcY3cwdw==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Sep 2024 14:28:35 +0200

An of_node_put(rmem_np) call was immediately used after a pointer check
for a of_reserved_mem_lookup() call in three function implementations.
Thus call such a function only once instead directly before the checks.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 6 ++----
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 6 ++----
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 3 +--
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remotepro=
c/ti_k3_dsp_remoteproc.c
index 8be3f631c192..d08a3a98ada1 100644
=2D-- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -576,11 +576,9 @@ static int k3_dsp_reserved_mem_init(struct k3_dsp_rpr=
oc *kproc)
 			return -EINVAL;

 		rmem =3D of_reserved_mem_lookup(rmem_np);
-		if (!rmem) {
-			of_node_put(rmem_np);
-			return -EINVAL;
-		}
 		of_node_put(rmem_np);
+		if (!rmem)
+			return -EINVAL;

 		kproc->rmem[i].bus_addr =3D rmem->base;
 		/* 64-bit address regions currently not supported */
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc=
/ti_k3_m4_remoteproc.c
index 09f0484a90e1..a16fb165fced 100644
=2D-- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -433,11 +433,9 @@ static int k3_m4_reserved_mem_init(struct k3_m4_rproc=
 *kproc)
 			return -EINVAL;

 		rmem =3D of_reserved_mem_lookup(rmem_np);
-		if (!rmem) {
-			of_node_put(rmem_np);
-			return -EINVAL;
-		}
 		of_node_put(rmem_np);
+		if (!rmem)
+			return -EINVAL;

 		kproc->rmem[i].bus_addr =3D rmem->base;
 		/* 64-bit address regions currently not supported */
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc=
/ti_k3_r5_remoteproc.c
index 747ee467da88..d0ebdd5cfa70 100644
=2D-- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1001,12 +1001,11 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rp=
roc *kproc)
 		}

 		rmem =3D of_reserved_mem_lookup(rmem_np);
+		of_node_put(rmem_np);
 		if (!rmem) {
-			of_node_put(rmem_np);
 			ret =3D -EINVAL;
 			goto unmap_rmem;
 		}
-		of_node_put(rmem_np);

 		kproc->rmem[i].bus_addr =3D rmem->base;
 		/*
=2D-
2.46.1

