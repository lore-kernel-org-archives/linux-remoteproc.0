Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498577;
	b=Ctsz6k3L8ULlh4Zq7zL2qe0/6yAGKmCbjj1eBWgbyXj52ukP6fWCH8wLlwiq1d21OCHQ
	 khQZ0o2HMiSETH6AVF5eMjVoxjkRUOEwOJQVrT42wzoD795tlUW5K38J8XyZkyi0pRD2Q
	 UWEAPEMwtzj3J541PIydA/etmeCRApNRRdP52bSGHNnQUYV0NnYgqW1Rz2PNQ5lGNmDQt
	 PCMRStX7gKrFecTS0uJf7XQ7CgtFNwmrj0l9bnywvRfAx6OW+RyMPEoRhVyLe4Xf6d1JB
	 VDQ/M7mXoF9ktowGEQwb6tZSJ15L1EJBEop1EKm39r4U3aEItU5nze4pIlsTUrzNEBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PGUpMcemVyfBVbieZwrWHkk4i4jDJi9m3gXexw58z8w=;
	b=xJIjmmVM6rHLgflTkbNnYQuOiy6TTe111cm2nV5Sg9i52lGVMRpswmVTHKtG99AnOmoY
	 cCuQTzgZlPqQA+0S9zxLZklNwhxreyGWHZatpjahMd1zA4+m0uagnS8YVESVeCaKjSFzE
	 cSo1p2gVC6pEQBFo/ad6a+EqekDMNzzpVmRFtV/dgVabRdABacHdzoD3Y8w0Ag6+QY8Ot
	 VMQIECLOEFbZXfT1fz6BuucYsbhjlwoxy5P704brTb98JKi+hNKGx5CdT4d+igTNM1/3J
	 bsk/tLtTG5+i7doEk2n+FyH7221jgR2Xt/A8ZCVas4o3gJTFj36jQg7Au+OWY6k0hDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhmyH61Y;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47699606A330
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2026 15:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47699606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhmyH61Y
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so9840325e9.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2026 07:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498575; x=1795103375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGUpMcemVyfBVbieZwrWHkk4i4jDJi9m3gXexw58z8w=;
        b=IhmyH61YqPxxP+Jyh6e//WkXhC6o63g3GEwuKoAobT++FxmiI0F2gJtl41dywOIgiW
         LO2T3CZWrHXExQ3cG1hy6ARpW4zfLKN6Zl7ym75TdEOTYK5kTayy57eVOckdnnQQ7oTN
         98QatQrx4V9qNBcINPfliqVsO3zFCYDefPUVdg4rSL7Er+X4uSKq3thngrGl8NWs26i9
         8ILq4cIb3YrJn9eCALkPtjZVE5sGtRVqwBSFBMBSHnEh8kJZ42MkAI8V1WAIKZ3CjUdW
         JGdoy9bvl4iWa7tXHAWXomrFCw8ZJR2Yx+7zdRTzBc4KoMj7bJE09K2B928rP/OlAQSQ
         FMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498575; x=1795103375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGUpMcemVyfBVbieZwrWHkk4i4jDJi9m3gXexw58z8w=;
        b=tjRn10e+4iL+Wi2Wm66+UmR1Cd4GVa0yEHtAo/tYbvPEgwfamsroh4GBtN+w0lr7ab
         in8Vi+ZfqR0OdbMJF2h6lf3OYO/kW6f7k0EueccYE0r5SVsLsFSUFJ2OcsvIhhIcxZL0
         fMhVWY4rjrPDtaKavyFhvtb+DOq3Fd1Urfpzw+MdtDYmJ01E/AgAjQilqMICG5v3e//q
         S4ne+Kku9Y2RkDCMvrc2h0PEWR3s8UC2PWtF9gz13pzNfNOEQ/Qood5/zLrxKvIAedfg
         35Yw+5E45ImO8Os6+guCN6Wc4/9NaXvMZphR3DbtFX+FNh/cFEpNFbL+KJRWyHOnzP9S
         U1Nw==
X-Forwarded-Encrypted: i=1; AL+hErFq0+wYl9be7iiLRek58mNSyu/EMABAxYvweh+kSPsiXE4erfAneTElO3l/sox4Fb5ssibctahuUWnkv7kaU2Na@vger.kernel.org
X-Gm-Message-State: APuU4Z+kJIlEz5psSxNGiD1JXNFVd2Djy7kI6sXH8Abz5xMKzq2iy/ni
	njctQvL2aE5V7cd1zlFnvKYgTRM8tKwwB6UgC9oTHZLeplnwGbdI8XmM
X-Gm-Gg: AYBFou0uFvDnA5XzyFCuvaa5ew/h75gdE4pb6QMZXE559jN2NwQVLpc99WqIm7d+TwH
	9KrayxhpygEK/CpfrSjJh71hRa3PyTbFiUzZ8LCsDxuHIkWJKHWwghfebxI4zWUWsTl8LdZ2tm8
	u/JrQI27bDZiDRvI0cFD02axKOBgFVOi2lZfU7CBxZ7vQ7eK7T985cgdODuC8WTV7whPYSB82Ac
	ZkdEPY3e/RChRkQoipl++x4wouPhNevHNIXRXJ5Q69YEh6sNWTktn/w9rocU699YqleIxXVWgxZ
	uRnkjUlfxfEpyt8Ku7xR3C2iioxNn+pgX/a0xUq2aI/KkjvPD2r3Cbeai17FSHMUomk3JgdLz9W
	9YSH+yMzY+hMWjCyAV0llPxkC71UgLiCOvyqHJghIBXX8YSYCyOSGWTG5rvMKGeAp7+axaEVl28
	VY9wS7MllewDrW/XKGi7Ws03xTeUNcn/KkUUMAFcN3VBjIZ/nEW5WTxFgnPEYwiFCmfocIptP3e
	JwZdFnV1LgkpckNUb2Ws+JtZ9Z1/mwjofwKbOGRSZI6vBvoK53JUecN6RixK1FUFO+nwVH1gCE0
	fg7y1HfylSAmCEAc7VAhQqm6Fdt+TtyhG7YLTJWWUxgWjg9My6apuQtI86gesVDjJoPCfnnXeaM
	=
X-Received: by 2002:a05:600c:6219:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb4e27995amr53713365e9.5.1794498575107;
        Thu, 12 Nov 2026 07:49:35 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:4868:f22e:b51d:7cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm139337155e9.1.2026.11.12.07.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:49:34 -0800 (PST)
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
Subject: [PATCH v2 0/2] virtio_ring: reject a split ring size that is not a power of two again
Date: Thu, 12 Nov 2026 16:49:15 +0100
Message-ID: <20261112154927.4004184-1-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The split ring indexes its rings with num - 1 as a mask, so its size
must be a power of two. vring_new_virtqueue() lost that check in v4.6,
with commit 2a2d1382fe9d ("virtio: Add improved queue allocation API"),
and remoteproc passes it a ring size taken from firmware. A firmware
that asks for, e.g. 100 entries gets a ring on which the driver and
the device disagree on where the buffers are, so the device can read
the wrong ones. The only thing remoteproc checks is that ring size
and alignment are not zero. The other caller, mlxbf-tmfifo, uses a
hardcoded size of 1024, so it is not affected unless that value is
changed.

Patch 1 puts the check back; patch 2 adds a vringh_test case for it.

Tested in userspace with tools/virtio only, not on remoteproc hardware.

Changes in v2:
- Patch 1: log with dev_err() rather than dev_warn(), and say in the
  message why the length is bad (Francesco)
- Patch 2: commit message updated for the new message text

v1: https://lore.kernel.org/r/20261111172947.3579982-1-stjepan.poljak@gmail.com

Stjepan Poljak (2):
  virtio_ring: reject a split ring size that is not a power of two again
  tools/virtio: vringh_test: check that a split ring must be a power of
    two

 drivers/virtio/virtio_ring.c |  7 +++++++
 tools/virtio/vringh_test.c   | 11 +++++++++++
 2 files changed, 18 insertions(+)


base-commit: 1a577f9402c1780cc1e663f48d5dd54c02051b09
-- 
2.53.0

