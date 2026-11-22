Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795379074;
	b=SCH+iAo0aehX11eyFHDU+huSlpeKsPf/gwvxVQt8vpsrMNJh77rf0SpJRNeyOYT6O1Gq
	 lcGehlslHTJ4VhVOmVG2KlEgrY8aY8E0oaJrlTuOLYDH5/obPSyEKUoCFUqvZ1ToYghNn
	 hKS2WxAXVKDNK/NJpMlpSgSJ/gFg7wGAcuvGoPEc0W52X0DjuHEfM27Dz6d4iHYggxQ1t
	 fbDVz6LHbQqBuzMpa8Agwt8deM0vJULEDv8ORzZrLgBwfmydrf1OLY6p1nRw80H6ln+Yt
	 Nsf4WC8UptVl5ZdipMVEd0BN+FdGMkjBQ/1CqLqDPc5572H4B+K3bICNOJzxeYz5EmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795379074;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=MOQ727e1ObZamn1nS+YgJdTdM8LCUKfEP9ISGZW7XLY=;
	b=ZdHeD7koeJ6ROsJtbBhttfmLv9PF5L99Su3pEo35ebcfw/LqxcsaaumovgKaqDTu4GEd
	 AsuF/VLG3RI8Jq5Wq5LZ6gZg0gvhZA/AJkjf+Ixq5yCktrEAfmPjMJYTEScOqmOjMyp5Q
	 XFumsCtww553U/RhXjHGLyPDIEjFF127Z6ZfAnEQQLtiDS7Q3Rgj7fpRpj1WiYLowaLbI
	 pAzMU9doVchc1ND1SsgEV/Lrlw+ZP8jHQTvIEkwQm1/tSp3QdR5gOdT6hiimYwx/7p3ve
	 N6cOovV5OwMkqgfPXecP1IgDHSepf2JHzRaJ5FFfMqVsudtDIPayqZq4h0GAIwLSBGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=diHnh2CZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27136606A680;
	Sun, 22 Nov 2026 20:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=diHnh2CZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795379073;
	b=p+UAMJXujUgMNztPQoRcaf3Y3G86RWEAAJXyuamPRxWi55Ip3doTpu4EPLY7WCjeFyyR
	 ixnKNeTZY8V49dZfXumybP+JehQlGK5YLWIQma2+nJQny6np7I9oOJ8O1rgUKPYscu7G9
	 pn47s6+3gnxVP3b+bIayGNlStbpp3DO2E+mEctCgn8WjBwyTFyOCiv2R7vijzWSQ6RKNg
	 MVCtiDA71HMKppglPqHLW4Dea4vPDuIKaBQGJTD1gi2lfPhwWQXtNF8dHXe4E7Us6XWLH
	 sDkUURPSBJbsFq26XP/mZwxJ/lPTx8Um28G+FJC4nvF8jcg+jcRLnq8PfLr5pt5jhvg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795379073;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=MOQ727e1ObZamn1nS+YgJdTdM8LCUKfEP9ISGZW7XLY=;
	b=UHcyEoVtIs0otPel3bFFlxrJEzRyMpJY/2ChkbvgEouDkmCWwao5PLmw70r/S6d9n6G/
	 70kqaQJ6Kbe1DIkiMDP5Frjas+6uwuIgrJ1YDf9fnOj+z37Nb+ZhHsgCHfLFPB/X8h1Hh
	 FjIAcrRIvl5oijQT/i001enYH+0iBe537PrCdhAZTvPljiXM4BCeAmAQNCbNOlKBb/PnH
	 Ith3N/w8it/V6EH7NDfFahr5rLvYyxNuIm8gPAVtjY5lV4WBxCD8C1olZUrzXyJLcTa9c
	 2A4DxkLGCDfAFdrxszZpLiGQiJUs4/0NZP+2LSYNpoXYN7bqHXXCXICSe83if+eatwQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F1B91F000CF;
	Sun, 22 Nov 2026 20:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795379073;
	bh=MOQ727e1ObZamn1nS+YgJdTdM8LCUKfEP9ISGZW7XLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=diHnh2CZ80PLB/f2Y6Bd6Te/aexDZ4f/jzAz0yePGGvwz844zztGdfedD8oscB12D
	 MAlvuI2sslpgYRszONYByWdljJnJp+lt8PNS8tjkmjBZY7h0jnFshDjO2FOFTAusMq
	 Stev1MraO6OSRPPBvyAPC7vOB5hjOChrmQA770zdAKPxiyXUS7uQkIQ4FRAaobujz4
	 eH1OuMJjAR/JCXt1qUBMTy429sCj8HnzaPAUV6qU508DE2mdViC4YgN7eg60r+e4jf
	 YEQFNkKDI096bhGvmsZNo0KBMgTKk6ljjXGmWlmNlQBrawIdCXUVDz4oaBj4xNBlDW
	 DoZS2bPZMXp6w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E585A4C1EB;
	Sun, 22 Nov 2026 20:24:20 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 22 Nov 2026 21:24:18 +0100
Subject: [PATCH v2 1/2] rpmsg: glink: Support waking up on channel rx
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
Message-Id: <20261122-rpmsg-qcom-glink-v2-1-d60419793095@ixit.cz>
References: <20261122-rpmsg-qcom-glink-v2-0-d60419793095@ixit.cz>
In-Reply-To: <20261122-rpmsg-qcom-glink-v2-0-d60419793095@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Dylan Van Assche <git@dylanvanassche.be>, 
 Casey Connolly <casey.connolly@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2360; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=06ZIYAQUhWWSAAEUAnmn8k9bBrxIJztSjTuxD93oOH8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrA09yMdhKSwVswez+9ehBpuUYcJ29+8JxL+s+j
 d8AC6ovBrqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawNPcgAKCRBgAj/E00kg
 cniVEACOoyCgN1DP4Wo2KEoeOdBiZGDfBZbVTaTfeV8harG1bv9zwlQei7kr/sHnOyngIq+aw3P
 wcJp7O7LjErJaM46/1rBeMN/bdxaz2hlkgv6GKT3eOmyX5j6ymcdduSdovBWXe/UdXbNpaUwpkd
 jmUfvJvPbd9yjBRZvZFnE7Gf1rR0Mn1R8l75zSJJ+i6ocjU+9HhO76o04fcBDFGEapyXZhaGK6y
 u6T9hDFR1AKEXQ1KFZcg2ZntqMlCsZI/d1wrIgeL8xTGUKrGjMTKmEDCNElikFlgON94K6SBAZu
 xCgPXR1RP9abb1TUWSXuRTDpj1lYuACobxZ+WKwwliCkQITeCOFvg+q3G3AFCy5W+lqrrjQYRTV
 urgOc1X33Qh7ySML9ymvtZmXERLlykM2PxQGb+3mvhJfybUbCNNWLs8RpSgaRbKiFQ49Gf8Pcnt
 6elPc1zvyPqDSTcxtIPXkkSIAvWEtDJV5noreDJFfS8NeESDpPkszvTZ0xwlCyAzhV1ZSzOxuAS
 vEJY2qG4us65Gm0Rq+YPCtUfPmzLEXyQp4BZlD5YxmqOw/ugckobS0KKgUXBxF4XgKq95Ye+95x
 EiKzAk8zu71ppVMKMrchPe7Tgrm6qS4HecrJYeLiAFwBxiOKlABtR5WH++woDn2nXGIoeIQGIKe
 rPwkGypTw7TaIUQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

Configure all channels as wakeup capable and report a wakeup event
when data is received.

This allows userspace to "subscribe" to a particular channel where
it is useful to wake up to process new data. The expected usecase
is to allow for handling incoming SMS or phone calls where the only
notification mechanism is via QRTR on the IPCRTR glink channel.

As this behaviour is likely undesirable for most users, this patch
doesn't enable a wakeup_source for any channels by default.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/rpmsg/qcom_glink_native.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index f848ab46161d1..02ac790251303 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -993,16 +993,17 @@ static int qcom_glink_rx_data(struct qcom_glink *glink, size_t avail)
 	if (!left_size) {
 		spin_lock(&channel->recv_lock);
 		if (channel->ept.cb) {
 			channel->ept.cb(channel->ept.rpdev,
 					intent->data,
 					intent->offset,
 					channel->ept.priv,
 					RPMSG_ADDR_ANY);
+			pm_wakeup_hard_event(&channel->ept.rpdev->dev);
 		}
 		spin_unlock(&channel->recv_lock);
 
 		intent->offset = 0;
 		channel->buf = NULL;
 
 		qcom_glink_rx_done(glink, channel, intent);
 	}
@@ -1684,16 +1685,27 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 		rpdev->dev.of_node = node;
 		rpdev->dev.parent = glink->dev;
 		rpdev->dev.release = qcom_glink_rpdev_release;
 
 		ret = rpmsg_register_device(rpdev);
 		if (ret)
 			goto rcid_remove;
 
+		/*
+		 * Declare all channels as wakeup capable, but don't enable
+		 * waking up by default.
+		 *
+		 * Userspace may wish to be woken up for incoming messages on a
+		 * specific channel, for example to handle incoming calls or SMS
+		 * messages on the IPCRTR channel. This can be done by enabling
+		 * the wakeup source via sysfs.
+		 */
+		device_set_wakeup_capable(&rpdev->dev, true);
+
 		channel->rpdev = rpdev;
 	}
 
 	return 0;
 
 rcid_remove:
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	idr_remove(&glink->rcids, channel->rcid);

-- 
2.55.0


