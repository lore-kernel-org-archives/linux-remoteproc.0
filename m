Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418197;
	b=Xnpi0iMwox9RccKvEyWuy3AavYMO9RGivl2kd23hHR2bVisNL/+0c943nNU6Fw8HWmXa
	 DTy7owba3MkK6NtsJ/3zRpHHJLL2ygCRxrXFrlE+Cmo6R3XDL/3zCHe2L7+w7FFXE70wU
	 8ijKeZuJkiUc4pgrxVz0Jclpf3LhR0jjDbnb/4c34CSoM1wO9/lCLD9vBwlvIOgmcqHv7
	 5otL4ExspqU456Z3vnwYLxN8HTXfizX7QSwm5OwetfhCYfzP3fH4IAI+lD3lefJjITXQv
	 yWpC8l7Q5GoS9Q+2VtgEFpB62IyK127EkhXJgklGe1jJBYwiDvMvy4xqx13IZUTqiwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qb4IaH1Y+NwiJfbuO8J0Ntl3vMKNwARo+dMo50vQgyw=;
	b=iPdyqzS4TOwj8VVQorRxLMYZvewqtN7XEz//r5tsfHU9hwxgI//qGlazxXB2S2CSfL7N
	 rFFTmwcAAPAi788HJlHKWK5QzSSjYJ+ZWup+ETacceYHHphaAdMDtWN9j7DmnQ66hQSyi
	 Fs+2UzJbC5WlTrqVkAgXFmCAR22+3Qkq9H/En8nbJYY1SzKy3wAxojFIFDFbUr/yoZ0bE
	 TD8RjSEoYw/9uuEwjkbQHZT06DvyE3S4bnZiYtopoaAbE3gKsJPpgVr//6vtbhv0ZP4HT
	 tL7uSfMUYok/9tKrrQF2MyxNkZZGNTfmYlGNlb1akOeXsnVSHEaz+AW2WznFHl/ycOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9XSG3h5;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21516606A336
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Nov 2026 17:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21516606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9XSG3h5
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28389865e9.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Nov 2026 09:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418195; x=1795022995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qb4IaH1Y+NwiJfbuO8J0Ntl3vMKNwARo+dMo50vQgyw=;
        b=r9XSG3h5Je/HFS7aFMcrtFIGfZZ3qyVK2FrPcFyAGpM/Xs6JS6b+KI51fyUH3ltU2t
         8VvkwGfhWdEusR0GLd7zx2rpPH/60ntIl3pbD89mnMqJP9fImjsLj9/3IHj8wIyYS1lP
         4UBGaBPvMzKwzbpiwikdR4SwcCfFDOpOBrPGdVfqDwso+IuFGOvT96QTxM2QGS8vkKN5
         2/yFWtg6iCMH4hLjxC6wGvkA/tdj/v/raNiaWih52u3bZhUOVE8l7cw6TmiUdPErMi16
         NL5jbQVuON4kU7n35ZQLM+5B4iTt8MHzSgXIvMC9f+ZHGcuDuLXmETr805kBHA4bjats
         M73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418195; x=1795022995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qb4IaH1Y+NwiJfbuO8J0Ntl3vMKNwARo+dMo50vQgyw=;
        b=k6ZVDePaFDsPvBAW0XADMBO3kc749DUJn8AdDjZyXkyLQwM0SH2j3sjY+WlHOxVbAh
         Av+5Zt3I9i/6Vk+ye7zjw0/vPcKfRZvCy2MBv4MnEyokFIsHirx/fget6HhQSZBXJbE5
         11W6q8s8ix4hrrqY6Z3oRTeRS6opCPMuC3uhWvU7KA927IbdIk4GxuF9aAkkhgpD+UnS
         ccrL6rpssH7PlnEUpnZ9I65ZwH1Uo4CnEbgVP8G7eWOVJdSYFHkgfTMBevLyflkG1yli
         LIZuLqqWxmQtLzD1lBi6/Gk0wR2mCUBOv+AX8x+IPhWLGuR4GXQjKS5UmWn5Z5a0WwrU
         TzsA==
X-Forwarded-Encrypted: i=1; AL+hErH1x3ULJjTIwltI+LHXJaGXmDqmCcnCmHJDzVp1hRwBQ8sOaCIhAtmM3cLoGcZPU+ZgIMGTR3OUtzynakGds8Yj@vger.kernel.org
X-Gm-Message-State: APuU4Z/gYSRmC4u7bsK8V8wVCj0K9XmwWQQRwAemrTCYe1VdN6fbaLLh
	SeTfUULCTTdVeEpY/S3cyS3SXvguyNB7OunlEnpvOLYofiBKueBUhELJ
X-Gm-Gg: AYBFou05d6upNWXh2C3eB6kH8QCGMolG06TSLj2k9k3NGDdieQ2mhU0BiGXI15ZapeN
	SYsT5Q6Bd22tMKEw2kpZ7xX740144Bo9wiq3EKiW6GfKAPrWdNzRWbjz+KVXanKtPJYY75FxaPh
	DZx/MzQwisg4nzfAq9qYbHRPkIi7zEA+XL0yKh8iZrcdz45lFKAtZap+oQMotxE6BUN1ZXrpSMq
	3xrXs3V2Xy4wmeiJMaSAaWUFFDkHo19cWah43BD6JyrMWW+gVTjJ/EwhrVfzfkD8se6Pck9edP8
	jzi3l0DpjgxqJhvla4JSLHc5ITQ2sdP1FQXBWUs4OOsImhJNYZ7ClZrm/JBrSAnaWP7m3QkcGyV
	B6/u29IeeAMY6hflBQlCbLepUwuAO9B6QRyFnRX8j9DklCLl1vbURVO1z0g/gbgF/+NRRZINeW8
	MBjCBZ92mWqE38DdL7Sk7/Aex76JRXb7t1qGjwOYnh+EH+tclWn6DNiqSi2hWywNW8mgGCQu/Ev
	r6LhJraYbJUGLLx/wi3E1B7WJqpv59aGnckySTY02qOZqzDjWcEXdb5bTOVmwUQnUG7agInnmLI
	2irqqEBbhROZDeLzvrfiheDPipnQoHsSxYxhVLPZL9YBFiKSzxYNmP6Rb6HZClSu59zKyIiMCOc
	R
X-Received: by 2002:a05:600c:3144:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4ba0939ccc5mr56490335e9.20.1794418195313;
        Wed, 11 Nov 2026 09:29:55 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:d655:6a9b:5ab8:7f68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm3134525e9.10.2026.11.11.09.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:29:54 -0800 (PST)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] virtio_ring: reject a split ring size that is not a power of two again
Date: Wed, 11 Nov 2026 18:29:36 +0100
Message-ID: <20261111172947.3579982-1-stjepan.poljak@gmail.com>
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

Stjepan Poljak (2):
  virtio_ring: reject a split ring size that is not a power of two again
  tools/virtio: vringh_test: check that a split ring must be a power of
    two

 drivers/virtio/virtio_ring.c |  6 ++++++
 tools/virtio/vringh_test.c   | 11 +++++++++++
 2 files changed, 17 insertions(+)


base-commit: 1a577f9402c1780cc1e663f48d5dd54c02051b09
-- 
2.53.0

