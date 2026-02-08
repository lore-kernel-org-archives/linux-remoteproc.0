Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C8829BDB1
	for <linux-remoteproc@vger.kernel.org>; Sun,  8 Feb 2026 04:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523468; cv=none; b=fSWfswUf6YyB2idGe/xAwy7L0VQhyVi9WqZctV5AdK+tED9z+wP19jg4oGJndTmAsouE4yMBteLBJmYKrwFdalgfCJr/ceyynRegEG7mBsjaEbI+IXQQqkCGN0BqS7SO5QPCLVw1+T6lHlql2Z4T2ImgBE5t533Po5wm3L0ZBOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523468; c=relaxed/simple;
	bh=JqdQec0rOs+m0iMnaYW4aaX9cdF6Y7D2liUU6inn8OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rW9FrMHdp6noqu+ce0mL7k0otoL/zXFZ9p0a3jZvbJvdQgAMlL+bvVXvoEKngz7mP9irkLl+SCcgaeZYZaeQ4eiJk7inwL3d6X+3FDU6OAiFObmVf/cMCdXR+A2NpEyN7GUq9NBm096xrBLRRjEKBAwnqJ9EncbyVbT27pd0/1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=icwSfZBu; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="icwSfZBu"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1249b9f5703so2505519c88.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 07 Feb 2026 20:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523467; x=1771128267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fnzf7MWfTqKt5CULJ7VuleY2h15FU3dGyOhiOi+Ey4Y=;
        b=icwSfZBu22HlS5tXNTzpO1kYfXysJE6J9CPTdSc5odA0xJXRhD4Ti55W/Q/KtO2O1K
         ida1AZXg4G7OeIoy3oLl6iatR0I8X1yqtgw5mpuU7nZ5262qKXN6L6Lco8kFraq3L+fR
         tWtYLniMfXM45iLkDI5UiS1ZVu6UkQs0yDhf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523467; x=1771128267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fnzf7MWfTqKt5CULJ7VuleY2h15FU3dGyOhiOi+Ey4Y=;
        b=NOU1eOXGWbCWPlsxg2I0Nh2zg21ZMPlJDRfv11/majXS1/UVMzvVu9l4Xnb7YTzkHw
         lJQKagsFZWQ90Yb08cDcU1TzO1j3yQr8fZPPuXU/G/6tzbytdi0J7Lvvk4XYpQe0xk/n
         JDkicsAUiGPLPwGO8oUkfC9P9wRHrjQzIccNdVgZSs4r+P8np613MxlgWwnrsyrpm4/N
         +IHZ5fFcfoCD/4e7EqrdNrCmBjRZmV57aTEIxJ2H0Qtg2GX1s5cd9P3MvDVGug3xq6IP
         Juegm1C8qd8HE6qH5D2bJbJOBSbfIVtpnkbS+K5IGyuWWeSbY7Gj0GgyHr4ntE8GmTZa
         Ad/g==
X-Forwarded-Encrypted: i=1; AJvYcCW9FbOHzQvxsOionDyYhfybZ4yUFQzJT3cUMdlNeDX4ZyF3ZFnOIMeHUJVEtIesrELqZtxf64hZ+Rtv+Zft731z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+FEgUj57wkIIL6OPEktjcZZEdT5WKJdw6J7OFJKyk65aeF+Py
	sUIQonOAF28qMjK9ph+uTDiUOgNwMSY71AFbhq78trsqXG2ZVs3doW3v9g8EWEzyE2luNX2N9Pq
	ctzU=
X-Gm-Gg: AZuq6aJXqY0TsBB//VLWBl31f8HzLYxJlVqsEiLqALrKI6SzivNK4iw29RZAs3PuZWV
	ybZfQms6fcT0CDyYVbw8Tmg1hEYP68l7lemyagSnFSRTdTV++KsghN7ixlZXRoXKZc17itPnlcY
	UaaX8PBNGB8lK+gOnj2P3mul4zBEjyrAedRqVemYF9XqQ62jbK5kuSfgYIQpxo9a4GlR5MSpZAc
	kr0/so34IidDxXdkJPkbiccV88CKeoJQs9uLBF51a+1j45iTpZhd62d3fGKDMgwRL9FemU//mUd
	zILFaWF6IDaFkgEN8yz9Pd2Jm+nQOPm9//upT9267nvbMolh5RNHvc7K+Kik5m3n0kW8ylvzWXb
	J9SBNUN38Kigbcmm+YOPkXxAPhU61hBzVRgfeRlR71PvJ1hndB2f52Oc4eljXsaek/q7rbH6B0A
	Eb6KbHJkYWgzlUBj8GJySxNcxxARIZrED08/ewqPrJUriZRA8M3Gn0QChWrNgiT63EfuYsTfU=
X-Received: by 2002:a05:7022:7a6:b0:11b:9386:8264 with SMTP id a92af1059eb24-12703fec496mr4040054c88.41.1770523467431;
        Sat, 07 Feb 2026 20:04:27 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:24 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	andersson@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org
Subject: [PATCH v2 07/15] remoteproc: xlnx: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:29 -0800
Message-ID: <20260207200128.v2.7.I90e87b8f7d6ddccfa0372bb96d196d2d9d7685db@changeid>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260208040240.1971442-1-dianders@chromium.org>
References: <20260208040240.1971442-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL message on the rx channel, so the
transition is straightforward.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/remoteproc/xlnx_r5_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index a7b75235f53e..de807247e9c9 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -245,7 +245,7 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
 	memcpy(buf_msg->data, ipi_msg->data, len);
 
 	/* received and processed interrupt ack */
-	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
+	if (mbox_ring_doorbell(ipi->rx_chan) < 0)
 		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
 
 	schedule_work(&ipi->mbox_work);
-- 
2.53.0.rc2.204.g2597b5adb4-goog

