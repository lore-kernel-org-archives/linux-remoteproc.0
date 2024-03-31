Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E24146D75
	for <linux-remoteproc@vger.kernel.org>; Sun, 31 Mar 2024 08:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711874774; cv=none; b=h9fMvhVdWMZ1pWNnLAiqXkShtsXPxH5sjXn2UDvMyPLZ4jI0SzaykdQadQQ9mbsMd4pbFwflt02x0TOcKSA0su1lUpvSoiXOfWUSfbo4qsryFttrjRd2kJeSZoAZpRT0YQxLzJ+Q3POGg1ivvJN2natLx65eRryH50k5P91r5hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711874774; c=relaxed/simple;
	bh=Vyo2AzXtnL+6nl0togC7Bicpz881704XBK8alsfqblw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHuxCVH4c+eIIi/dWkmSYf2OobdX2RKdiiW5oiZp1k48QhFgJQJBv6D5QEazy+DNNznwqnOxPgn5vhEd6Ti1Xd2TbgFq5uYhKlYmc9F+7W+Aydznm7LWkVM7T2SzlWtdCd7wBw2Vob7uSFxrlhRUaC9a57FxJx1n7WZ48byirBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t3E0jLbE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t3E0jLbE"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-341b01dbebbso2890248f8f.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 31 Mar 2024 01:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874769; x=1712479569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUfNTipefEmXHX8bGR8JVQXCUjDv6U/ZK8sNVLNneMU=;
        b=t3E0jLbEIMEfjdxS4G4cNcmB2W4ATNsVpEcFlNGcSZ8T4IP4DH/kFYouA/xozgQIl6
         R6nW8dj8BA5fF5AXW/B9eQ8hZy1O1sZ+KsIoAVRwR/1sBbIdkG1oPVtCdMslW4zSYJT2
         2ETTyYDwnTHVdRATCpiYpfDpQN31nVip+b0kjIQEiCrmI0blSpFqHnHsFt8ywRvrF7I8
         eVJIRoqo1cK1NBIljPPCv1GZknUSEvcpo49VX1FWZifDcRhBYLEGF1F/YBZlMo7/dNgJ
         jz5ykbHbnJGZTCJCEcYPPLo58Ybwy6flioNtPv/fecsgJK4HsB9+8rQvP7yA+je/tnyQ
         tf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874769; x=1712479569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUfNTipefEmXHX8bGR8JVQXCUjDv6U/ZK8sNVLNneMU=;
        b=AImeADJ9+e3h7CijQKRqLeV8SQlakDGik05tVNW6D3nx0+7KTn3bvI3raxm41mglMY
         vBC4Zr/hWG1KazHNHsemADcAtM84tLWq/JD810zRJ/17AMsVi9Lo/3gj9JNpg2h/LS/k
         zPepJksIygPs4Zm3/3e956U0R7Pb7/jEvkqQYunHluOM3Z+hGkpsP1jFbLUpyawMy6gH
         63xkj+5KOKNTcabluO8mGkm4FTrRAzRrCG/spZKq6IF6OYbDzEz6xzZyKLI7Jl0kf95p
         mKaBHiU/UNOUJs6GwZZogSJ+/yJUy5Ki00DqsQHjB+VyOS+v6Uay6PtbWAErg6Tr0KTW
         LSEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz8XBmzHSb65NQxpkTgB/rZF+VtiMUzU3dPxOpZp58C7Vj9rNM4fxil3SY+nYWAfVd352h1ZvktPMPM3fM/AJG2HMWwQzesS0t0KfSezUVQg==
X-Gm-Message-State: AOJu0Yy0hYBiiYPS9EjjcnBmBgxr25ylYJKeriJNvdq4TGYe67xjg+12
	fP6F5kKd8rm1eapkIGE3GSGbEF13q+1MrHUv0Ujk64RBaHFQAPz4GrFIEVkLNCI=
X-Google-Smtp-Source: AGHT+IFWevhYpwJfNDhRVePhOCKsR2pLuIuY4+m5hIw7WrVLFKSGSUKbdP+zlvsvE7pLRoSnihSMqw==
X-Received: by 2002:a5d:6451:0:b0:33f:6ec1:56dd with SMTP id d17-20020a5d6451000000b0033f6ec156ddmr5675223wrw.45.1711874769326;
        Sun, 31 Mar 2024 01:46:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:46:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:09 +0200
Subject: [PATCH v2 22/25] rpmsg: virtio: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-22-98f04bfaf46a@linaro.org>
References: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
In-Reply-To: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Jens Axboe <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Amit Shah <amit@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Alexander Graf <graf@amazon.com>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, 
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>, 
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev, 
 kvm@vger.kernel.org, linux-wireless@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Vyo2AzXtnL+6nl0togC7Bicpz881704XBK8alsfqblw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJjAziX1LvXxL0d2928/VbSKx//pADCrWW+j
 FN9OFXbeL+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiYwAKCRDBN2bmhouD
 1/jLD/9KtMVjwOhUEJDx/ub/l0GG3C9eq4On4ikCu4uU9IktC6UQN4qDrfdIyavpPOM1thNNvlj
 atCzlA5IOQasnc05bfUzNkSHtv5crrSwGdZEo4ZGWlRxKUovKWlKC8GPWUjHoOMaB9E6p/F+e3N
 opLqOlWxnMfxAEaImxYl9WfXgq386SS+gyHwrrcRgQLzEihLWj/CQua3yBGYVru82G0iXFbyE1N
 NnpHS2LEXz9nUeiuz8yHQM0L3H/tP2KNCMOI/39T4CdjJUfqp7OV6XwRZBRHzWMgetls48hoxkJ
 tOQpD8o6SgwW0tEorSmgALMFN+e/z9jUi7IsyY/bpqLm8yP5eSBSxDxpNBCnfN5imfW/XCYQR1w
 ANS3OEXZQLudpa/cetAhWNV865x71WlsJAit1xDRCqe5oCCDdUgcgBYiTeQp/Ddvh4qsAF71nGt
 RTT2WKt7qUGR/ddS9zBe+El6BRYcWYFDzqWsjTaOoUbSZBHTcfgGg2SQDqd5lO+eaiS+ZQLjFNp
 f94PMSyEfpoISfRbHubkrqwR9d4hfYhtjBhFfWbHU+Igy6/zMawFXf3jgIpiCjX/jj6v6qpfda7
 umdXTfdN0OqQSTG2VarkPNsHyo94HagoTB997ZLjFLcYuv5EIg03gCjYeLLIuDAXtvfdat5mLgb
 odNYlyqVAniZrZQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first patch.
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 1062939c3264..e9e8c1f7829f 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -1053,7 +1053,6 @@ static struct virtio_driver virtio_ipc_driver = {
 	.feature_table	= features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name	= KBUILD_MODNAME,
-	.driver.owner	= THIS_MODULE,
 	.id_table	= id_table,
 	.probe		= rpmsg_probe,
 	.remove		= rpmsg_remove,

-- 
2.34.1

