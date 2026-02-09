Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07A330F543
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Feb 2026 23:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770680676; cv=none; b=d0wglWHB1Ll7GGvUn6Fdr++XiKnjRl99+XBSKPNFEsq+7B6LTc4wGlMZ0Tqpyh5tOJDTjJ1uUSEq/TaMty3DzK1cbNVbFJyTup++9UAol/4KZRNYFE0zjD8ovJf6RWs6fp8SNEVer0H00xeKhsFM2urfT9Wif+1IlHmJ9XWHPqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770680676; c=relaxed/simple;
	bh=WkWA3gNRN8MbTIaaw/WdnYAdJq21Zd6sjc7Z72Y6cd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dgKjmxSu6yzg+aKEjjUlJxDn2LQimKDOQNCUtv2PunAMJGVolx92O1y754pbHIdkBnh8YJ8mNlSz+F7ij3quXUFRpJ/GS9JZZ/D32PCuGwB5lCYr3Um/zaAMQFd+bF4gZp/HO9lzENtK6bF4RdCWCmsLKHC1N7yueN3u4rPiUvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Grk/k/Ih; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Grk/k/Ih"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c6d8751c88so526255785a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Feb 2026 15:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770680674; x=1771285474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+H3/GA2xrGI8laFlb2XtgBdDq8ZI3AS2aMAn2lwL5dI=;
        b=Grk/k/IhkAQJzSrSNivBznjxGYecSeMytwjmN2FGG+9U/p/c0p56QEAoysyI3aV0m/
         N/CWHrYwaBDyAWmvHAAnJ68C2YmjrXRAOK94qA/yy0KVAJkHYuzxZYLz3SsZzWVvL5UQ
         rY41bXrZnPkTwzHzCz1yRY7163bFTPnI3Aaca3drk+EKPWZTM6F8QQSfiW8GYgK2MF2k
         qYqociwtK9q5mqMMUpn+wPA0XFUtZ8wQyaHMgmL0EJoUL0AgNy+5krhPjJfF2ibjSniV
         k+D4/7VOc/3zbpTGrAmNpc4+GUL8RJkbHcUjmmLazj++YIdnN/NlMJ2DTQ/QKvEwnAkZ
         hcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770680674; x=1771285474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+H3/GA2xrGI8laFlb2XtgBdDq8ZI3AS2aMAn2lwL5dI=;
        b=n8loYy/N9uFQHqRrEzZJShXvhd24bz2dmnv2T/Q25Afq6fi5Sz8lsYfVK3GwkB1BR5
         iENliT+w8Uoezz9vBlJs2yunJQd7BydMFaSzF5/UaftTZc94GQFiLNBTIjBcvo7clzsK
         ouH+hT/krbvZCOpMpYEFKE28zVpX+y79H4IAMyQLAYN9tAOKfifnPsxB6xgTMZxkJc2w
         Dz4guWDJtPQF7KlfuvxfC8iPjAxMhzGo141xAzRu2lMQ8o8oTcMfXSjhwMfKIjfqYO7o
         3eX5s+PjoeAcppStWVz3EerOzZpR26iebUj5/Rb/6AwhpNNz2qIP6HOuQSUvZ23vjChY
         VMXg==
X-Forwarded-Encrypted: i=1; AJvYcCUPN+oi9n25XvnCTg3gMlHGGuDIi5TSiq2BGa5bCOFKPw7N/KsDmkBKdcsOOI209zMDUed1fNlkIwdEsqaP6k+f@vger.kernel.org
X-Gm-Message-State: AOJu0YyLFHbArC2v87Ehd7ywo3cW3XDC9fDUM6rnIEkFTsaSDYH2jyyH
	sX+lAqOMoPiYmZIzKbzC4wmPOf/ZXqzOe+v0U2Cjplg64tAHMZqV7MbgDJrBfQ==
X-Gm-Gg: AZuq6aJAhQG7qL9vVjksJL5yhw3j881c1Jtq4EvziXgtKiZWceCnnCXM0U7OLsbOBUe
	N25ydOaZsqbc9xMXz0+0Uy5niCwm8wMVIz10LZyDnLW2YZBn6PND51Q40Ai6awfvIXce+3FNDKu
	k4ffokc5/HuAEWvYt6JN/6aNIXmui0fG7laqUuJZR/8f3AEoeTLo0QKieeKpMuZrPP2jE+hQ56I
	uj6xYIKhXFGXOPvwOGnN07xDbAm6xM/ZeBMSjxbidYPDE+bdS9ajuDCaNAne6uU8sIhjGgn0B1z
	ju60ue0jpCPFnKI8pKWy9gRYJu5Vb0Hr9Vd5RfMwCbwafRUL5w7JjiirZiEe/unF/pACSuUTsxy
	O/Nle3RcpSuCNTyoFF9cZvozqHVmQyXt0+47ty66qUckm1Yv1BxiVcuVpH8hv1D4JVuwclQCtQ3
	jm+RpBMVdwCLA8AXHBBpz4DyTogXTYGRBNb6yu/3Er8b17RhN5p+ovFb6Dtf1aYhAwFYFkQdY4B
	s9D+Kxz91Vr
X-Received: by 2002:a05:622a:11cf:b0:501:3e36:1513 with SMTP id d75a77b69052e-50673cf1e54mr2558791cf.6.1770680674531;
        Mon, 09 Feb 2026 15:44:34 -0800 (PST)
Received: from Desktop-PC.. (wnpgmb0311w-ds01-161-217-39.dynamic.bellmts.net. [142.161.217.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c03fc95sm87426066d6.26.2026.02.09.15.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:44:34 -0800 (PST)
From: jassisinghbrar@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: tanmay.shah@amd.com,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH] mailbox: add API to query available TX queue slots
Date: Mon,  9 Feb 2026 17:44:30 -0600
Message-ID: <20260209234430.512492-1-jassisinghbrar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jassi Brar <jassisinghbrar@gmail.com>

Clients sometimes need to know whether the mailbox TX queue has room
before posting a new message. Rather than exposing internal queue state
through a struct field, provide a proper accessor function that returns
the number of available slots for a given channel.

This lets clients choose to back off when the queue is full instead of
hitting the -ENOBUFS error path and the misleading "Try increasing
MBOX_TX_QUEUE_LEN" warning.

Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
---
 drivers/mailbox/mailbox.c      | 23 +++++++++++++++++++++++
 include/linux/mailbox_client.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 2acc6ec229a4..22eb8f3213be 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -218,6 +218,29 @@ bool mbox_client_peek_data(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL_GPL(mbox_client_peek_data);
 
+/**
+ * mbox_chan_tx_slots_available - Query the number of available TX queue slots.
+ * @chan: Mailbox channel to query.
+ *
+ * Clients may call this to check how many messages can be queued via
+ * mbox_send_message() before the channel's TX queue is full. This helps
+ * clients avoid the -ENOBUFS error without needing to increase
+ * MBOX_TX_QUEUE_LEN.
+ * This can be called from atomic context.
+ *
+ * Return: Number of available slots in the channel's TX queue.
+ */
+unsigned int mbox_chan_tx_slots_available(struct mbox_chan *chan)
+{
+	unsigned int ret;
+
+	guard(spinlock_irqsave)(&chan->lock);
+	ret = MBOX_TX_QUEUE_LEN - chan->msg_count;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mbox_chan_tx_slots_available);
+
 /**
  * mbox_send_message -	For client to submit a message to be
  *				sent to the remote.
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index c6eea9afb943..e5997120f45c 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -45,6 +45,7 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg);
 int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
 void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
 bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
+unsigned int mbox_chan_tx_slots_available(struct mbox_chan *chan); /* atomic */
 void mbox_free_channel(struct mbox_chan *chan); /* may sleep */
 
 #endif /* __MAILBOX_CLIENT_H */
-- 
2.43.0

