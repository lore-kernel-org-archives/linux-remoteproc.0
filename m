Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793979993;
	b=HNx6kvAmHOhU8u3sKD97zAwHKd3D6bzrTJ3lsDLB28Z84kFvb6BaoJQojH8ug0MO0O3M
	 zUJMb7fPYLrC3K3kO+nWTFfO5blZURPa0xaPDZyCk+sjzywZpQ4IMXIv2AJ+9JHLCQFgX
	 mMK26z1Tsh3PBKJtjP+6yByEtV6aQM7aqwlKxPZENqVSukV9bvD4lYXrSysTbmd3JGBWg
	 YBoQrnytjeWdwqKavIbu9PBlx81HTiIuXOubBm4frE9rQoNP/juU7YUVI0nBIsa4Le7br
	 6fHeovhO+GiGNf5R/yOAiWEGMdTxgZC4MgCxMcF+vi62YTlc3eZTV+eYKCkIsMrO2XQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979993;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=dQxWsk9tD+W0rC/Z3zWfzCTEEa3rqox9nlVNEL9xNjs=;
	b=BLc7OaZqNcal9VHHYAqDaTW2uG6Krx3yT5YIQZkncKEPJVcYH6AM5e2VJIJgiSG2Z+uG
	 V23FRt7jj4bHdn0fkKSzCzQ3O9MiM7cq995xSGm4Cz4p7s8Yens5KJ3XLBg6Cc+Qe0EUG
	 g1U+e7oMhzU8RpiV93eOuvttlGScEwmvEc98c7BGnl9dsZekqS8qQkavPeFeI5CeKa+ny
	 NDzhCIyL5/gQZb71nM4JXyoMGznjjreEf8T92w6Ru3XIiaW1nBQZl8PfTR8OPnq6UVUvp
	 Y/CBtfvYM/t6s2knWKKiu1HVQ92Mv1vzRze6X691Pz4jFAI936rMJAVigr9hy1ZhSjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="Sp/JpgQX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEB2606A330;
	Fri,  6 Nov 2026 15:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CEB2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Sp/JpgQX
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5AA9F202AA2;
	Fri, 06 Nov 2026 16:46:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793979986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dQxWsk9tD+W0rC/Z3zWfzCTEEa3rqox9nlVNEL9xNjs=;
	b=Sp/JpgQXhr+nR259tgROCK66kbPxBRRhQyRqDv79wzPzEd1HnV3NEBZav5AuQprur9G6lm
	wXxjtFo4UMTWckSktdHFs4qgt1WY9UrVWZt3mLW18Yb83XZ2Bex67fMv18+dlOIM/M4MzQ
	OAChgFA5ONzT4TNaz7/TYU+uQ40ZF8tflbWO5G0RtJ1vZP9ZdUf4AKIkOQao+qOsx9mzHE
	1qNs8GtmyBBbBEI05jOThq3hBvq91vEwSnqkitw5f3nsOJanpNa8qGt6j//EXeIHTcPxOc
	kVFHFLoTmS3EWc1VRMtxd9hp3FM7m5daiv5OTyhKDPDAxAruFa++dbcvYjn43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793979986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dQxWsk9tD+W0rC/Z3zWfzCTEEa3rqox9nlVNEL9xNjs=;
	b=elygiWiaFCrYJ6qHiJfHR/G9HnJlkwBEwz6WZjXxxlIROt9cdFMD8jg1wXaR1Qr8kkZHic
	6AR4h5Vbmd8jDRoZj5n0njDfiqHnYIgPj5s0pXxl0z2PbqKkgrQ561EemZa1es9g63cnlZ
	A2WCZKdBvZwf4UCD65r0k3eflLMc79R+ELzR8BekQY1TderszKbjWmrLrQyL7eqIJ3DGz/
	77YdSNjb9UYDf2UyjBrK02dPood+TMK5YvX/gNqsbqZ+shqU8os9jMS93V6GVZahd+L1sK
	gtBpGmnBklQMvZ+AN8+QFA3M1gZ6kahyszJGD2TnKcBuBMc1udMAA4EsaFwGRA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793979986; a=rsa-sha256;
	cv=none;
	b=EespJsucjuk+1V30MTNlXQz8ldN+LyJ7mfkN9pgw4ifyqppT8w+fYNXVPXTIQYRAgl52Bg
	1FZC68CXwKbWZVLKCph4uQh6ABJVMmgyDTOsUOiL+9y12g74wesPuOj1cnkLjIUNLJdCnd
	0twYlyZGvJzHHCKQOzXKHjk9VzF6YvAom/GvrHh2JUWIzAr5InGVfHvfO/8RHOVkNRvOfR
	3+bJZTlUppKLmiDQAUA936M1V8qiQzl3lU15Qd46eNUnpJU47QRnNnjhItt5GFy1IgUm04
	0FF4V8MEviGWH7sELpWTdDE+im++ihj3j18qwqEQQerEqWWZQpmvgPNIGnuW2Q==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xPM94-002vNF-0r;
	Fri, 06 Nov 2026 16:46:26 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 06 Nov 2026 16:46:15 +0100
Subject: [PATCH] remoteproc: stm32_rproc: Do not request reset by index
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-reset-deindex-rproc-v1-1-41a03fcc8496@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAEb27WoC/yXMQQqDMBBG4avIrDtgIgr2KqWLNPmt00WUGVsE8
 e5Gu/wW721kUIHRvdpI8ROTKRe4W0VxDPkNllRMvvadc3XHCsPCCZITVtZZp8hNdCF49I1vByr
 lrBhkva6P59/2fX0Ql3NF+34AL2AJoXcAAAA=
X-Change-ID: 20261106-reset-deindex-rproc-3c1aa2e9325f
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.2

There is no need to request a single reset by index.
Use devm_reset_control_get_exclusive() to request the first and only
reset.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/remoteproc/stm32_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a47e040c6db8..1443a4013d6c 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -696,8 +696,8 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	ddata->rst = devm_reset_control_get_optional(dev, "mcu_rst");
 	if (!ddata->rst) {
-		/* Try legacy fallback method: get it by index */
-		ddata->rst = devm_reset_control_get_by_index(dev, 0);
+		/* Try legacy fallback method: get the first reset */
+		ddata->rst = devm_reset_control_get_exclusive(dev, NULL);
 	}
 	if (IS_ERR(ddata->rst))
 		return dev_err_probe(dev, PTR_ERR(ddata->rst),

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261106-reset-deindex-rproc-3c1aa2e9325f

Best regards,
--  
Philipp Zabel <p.zabel@pengutronix.de>

