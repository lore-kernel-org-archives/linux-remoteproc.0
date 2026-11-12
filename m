Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498579;
	b=RTuHBt7dqwKMGIjCDM2olgcHirk4/Hdyn8D/ShBslgKCvn1qpLpgzOIf41aZelCR/cio
	 Tpv3SElhBE8Wx+86riyh2JkKkZzbVKjdZYJ1KGY9pj4d3optOX7Ms+Dk3xyGOLvMOYVH+
	 vmwDIpIU6oTtmk909L47KX8i33N9n8B5RS7j8et06KDAzRKvGJyLIk1J41J++nrDahfmg
	 LNxB1sGKYzthQon4CO485RF6RE15gZSrI84BUJw3SuemqAjPvHbSX2H0WEGcsGZb5D1sV
	 r49jANhIInXIGbHBrOrJzEwerbwRO3fhmb/PGFQ4zmPXqcRXFhk8SvWdjEj2+uLfqHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ve1FkPgDNt0jdst6TwlwSyNCOB8aJhkSUavfhKtflTs=;
	b=H9aZ+FRZQR0j0bxBK1133PcpX7pEy98wFWVN1HAwVAMEPJhRYUMK6lceALKeFFPq/miG
	 K1/o85lEG1t3JyziI2H/ERU4QbgLIlPvgg/ej4UfFeAtNEDjwNDbnGqaQFd7JZIYoiU6A
	 o9V7a/vygbX5cOv1rnnffe1mpUtgrE9wt2bjmABqNzc+Lj5NUEjtTCGM/St2VJhOf9NfO
	 X9IEPpP1L6eNLN9QoNPtu5MATIKtZjEL5Cey4ncetchW8IXToN7YJxNvvn+T/yF0zyZIh
	 4nrJajE6acQWeFYjLWVF04Ry3orcTP8KYwfq0C3C5Ex9XRZh5yp6H54zJMO+9PIZSYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+1yPzPS;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0654D606A890
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2026 15:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0654D606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+1yPzPS
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so6660665e9.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2026 07:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498577; x=1795103377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ve1FkPgDNt0jdst6TwlwSyNCOB8aJhkSUavfhKtflTs=;
        b=k+1yPzPSmnde0506t7WZ54MUMqLuvgWsL+VtyeRmw1OmzDr9tDzPYMbpPhBDKfCYfE
         kAboTZ8nO++NdeKzP++4oxNiQ3yKhcR3PvdgOE6j+3kiatcrthX2Vw40UX0GCtrCp1q1
         6mHr1khSGQJi2aCODY5f5GCbGPgT+lQ10YeHh0f9ovn9wTZQPOgVK422ymdOJnw6AjS6
         8Olf+KTa8jtYFGFVxCrGH+8Vu1poVqLv7PEF3dzSAI2NzA+bGw7MY8cWhnUDDGC1DBg5
         wreWr8A3WwFA1sGExh44od1EJvUCg8WdnEKaa+EI2ClqHuByGBM9UgQnpUG4Y2GPReG5
         9YAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498577; x=1795103377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ve1FkPgDNt0jdst6TwlwSyNCOB8aJhkSUavfhKtflTs=;
        b=iWk9f2U2OK+vQrL01Gab3A5z1XCBPC4gHknACRr7PpfqMxTrx657rI1JZSqLjqt0BW
         bF4hwDLaLynKzTIbcWogLP3FjUzTNxv6w2bUF5y4BdQRONKBErQ6r/jojAvoXY0CT0HK
         xWXoZlDZTS3AcB+8VuAdJ5yFMOpvRrWWllinb9khEoHrShoQqmlIVycOxV1NAHzWjMsK
         M3mBHPFGwnGmvRjbTmeWndAmEPiLtkHnjT/wZpstXkH/snVyWS/rJ2bYJggvdD3lDQMr
         OjwGx+OMYTSiF3jVouRLT2skkx/AzXSKQcDhoNR8U5U5VwVekWDmEBKYg2aJ2bs/N9TB
         l1TQ==
X-Forwarded-Encrypted: i=1; AL+hErF5Tco3zKK2+hQwToNEbxu8BNSbrYKcLlktwa/0nDMqHqwArNv0N5f/8mOEDS87+xe9rZwhCCTvsmB/wKa4aUUN@vger.kernel.org
X-Gm-Message-State: APuU4Z8tWx9mp/7F7irj+FSD0dkWkiKplE6Om1gnNfXZ3xvBgPv1jNf1
	+aZu0pcHJR/bUTolrbr2l/emveEnjp+zMSbvqGXQJZvnOtb9bIUJf2wB
X-Gm-Gg: AYBFou03VJlr+yvONQtgyKtNwW/mmbmkxW4LHwf2MduH6zpUWE8KjKPTwNWeNYcxaNW
	sCOPuwN7VZQT0IFTx/ROPbNHQOjOcUw7mhCsKBuzGznvJRzycb7MdabRYgo0kisiBkhRLzgnC10
	kkW4749nv0jps14EbCz0BV/zBVaXp93h9Rq+JQcqNOrkcMtx+RKSQZme8T5oiOtC+VG98MFIWyG
	VDVwLJOjKoGXpoF4VgY9isnIcZR80tONMjOwyva+CWOc+60Z+y0kfVhoUiDJt6A61uY3kJKBKWA
	eV7xYFYoybKa5L3reVExX6lvcgfTNVa2MXA2EY5rlwc7XNOtyyhBV2WmhLQIBdVKVuF1jkwwLPE
	5Q9sjIDXb0SmpQJSbnOSzr3uL+N81Ylt3leVCGD9HIe6O/MTUcsvBe1lOgBWmsmJK/lzrk/F+EY
	QGBCUDsKE5//Z20cNS6kJ8QzOHl+noKl32okfzjJ9MQPJhTP62rncsEuFTbSkVQTZmTfVMtaLVM
	NGLi01r+Y4YnwMMNeoloi+nsdOT5PTvhGAn76DVIhp8t5THSx72i/5DpqdUvxQRJvgVvgMRXYBr
	sFUn/W9xQm/8einmS2udxEJNKwu2OYiPYzPCJ2cMbmFgouQ0Ban79SZt4tgyK9h7M662vU+sxmB
	I
X-Received: by 2002:a05:600c:19cd:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4bb4e28d076mr63675105e9.11.1794498577427;
        Thu, 12 Nov 2026 07:49:37 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:4868:f22e:b51d:7cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm139337155e9.1.2026.11.12.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:49:37 -0800 (PST)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: Francesco Valla <francesco@valla.it>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] virtio_ring: reject a split ring size that is not a power of two again
Date: Thu, 12 Nov 2026 16:49:16 +0100
Message-ID: <20261112154927.4004184-2-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112154927.4004184-1-stjepan.poljak@gmail.com>
References: <20261112154927.4004184-1-stjepan.poljak@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The split ring indexes its avail and used rings with num - 1 as a mask,
so its size must be a power of two. Commit 2a2d1382fe9d ("virtio: Add
improved queue allocation API") moved that check from
vring_new_virtqueue() into the new allocation path, which
vring_new_virtqueue() does not use.

remoteproc calls vring_new_virtqueue() with a ring size from the
firmware, checked only to be non-zero. With 100 entries, for example,
the driver would put buffers 4 and 8 in avail slot 0. The device would
look for them at slots 4 and 8, possibly reading the wrong data.

Put the check back for the split ring; the packed ring has no such
restriction.

Fixes: 2a2d1382fe9d ("virtio: Add improved queue allocation API")
Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
---
remoteproc still reports this as -ENOMEM, although the "Bad virtqueue
length" error names the cause. Returning an error pointer from
vring_new_virtqueue() is left for later; the same change for
vring_create_virtqueue() is here:
https://lore.kernel.org/r/20261106055635.3019889-1-stjepan.poljak@gmail.com

v2:
- Log with dev_err() rather than dev_warn(), and say in the message why
  the length is bad (Francesco)
---
 drivers/virtio/virtio_ring.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index f683a2d6a200..f855b8d41575 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -3513,6 +3513,13 @@ struct virtqueue *vring_new_virtqueue(unsigned int index,
 						    name, map);
 	}
 
+	/* The split ring indexes its rings with num - 1 as a mask. */
+	if (!is_power_of_2(num)) {
+		dev_err(&vdev->dev,
+			"Bad virtqueue length %u (not a power of two)\n", num);
+		return NULL;
+	}
+
 	vring_init(&vring_split.vring, num, pages, vring_align);
 	return __vring_new_virtqueue_split(index, &vring_split, vdev, weak_barriers,
 				     context, notify, callback, name,
-- 
2.53.0

