Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854561;
	b=HP9TKb5mTNzccsruUdSO1sJk+i2ABkNb/ECYLQXDbr4VwbV68W9c7adHvlD/Sv31Nchj
	 9T8ei21iXfrS4E6lKfD6dHGfx7A74DJoIgsnRB4re9NRbYzErzM6WcLFxPc315NM5FzAA
	 t9ZuzpkVZcuiD1nYkbN3zTz2baIOdY+B1QtrM+oFdZihyX+KpHBgLYawtSd28xcYOs6Fi
	 ru9uvctqQZp8ae0wTqdL+8GZ4gjr+ADyNDMabHVdgzVAHsMnJO2NKMK/jxjvZzyLhYVbi
	 kLMAntZFsGVYvQGo3ni7i0s1CobzIvHoQAY7qiZm/QZ3pOSnh0HF0XnGFmEpe5flYsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=d8QejMQ8QLiAIMTZzDQaFIDsTvrCunV4tv4nuQkvzNI=;
	b=41muWAbDGaDY2Pp3fnQyv1iO8jMUPhMKYeLSFlDc2/uINsIbNv4SOMBElhjicmix2jUC
	 zwPG+QE0sIN0x/WlYF6lz8y1VUIdsTZVcRDP3MM/2xvBt+jfrUHY0aHzFwozrFQtDTzAM
	 v3cl5Z6Gxm+aCU+VXoAXmYr9q41oraTYOc+f1Bl+PcafoRfnBzothqATCS7Y3im/kH1Cu
	 nFs/Cx2hq4HozsoVrjFEGiSj4ve9d2PSy+0jmVV3vAWhOmziXwAfh3ncES+PO3AIkDKqF
	 xSzob3KzO/xS3I01yXQ3nMqJ9MQWCmUkWf2pvHtJSyqfo1AOEaBNxYaT/NE5EtE2j3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKSPlzH3;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACDA606A323
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 18:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ACDA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKSPlzH3
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33c10faf6easo460603eec.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 10:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854559; x=1795459359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8QejMQ8QLiAIMTZzDQaFIDsTvrCunV4tv4nuQkvzNI=;
        b=nKSPlzH3BLgJx2O/d52RTsnCCsdJAG5TlR/mE9gMryBY4tjAi8tzoKd8YYF0LKwxNI
         KBsGNtVjvsxUOx2KCiOyE/wqPAM4a42lqFxmiLFTZsSr7RS1/Ootm9JmMB8KyeCIXWTF
         r5poNxeDJoh+QVvkorPkIqfpm7n5hhG7KuV4LG4Kb876kgyO07/+NkqEGs4le9sJ2/wW
         qauJ/lm1hIH080eZLrHLrXscODs8S7/JJeHraQj/g+KJKvsqWsB117vjzz8CGI8r6tKf
         LkKql+GH/xXkC9vai3hc1PWqxRXS+VONMhr6hxYHuKaMuwc/uPM16eV/YsgCe6rY04+w
         A05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854559; x=1795459359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8QejMQ8QLiAIMTZzDQaFIDsTvrCunV4tv4nuQkvzNI=;
        b=UosDfZQEQi8gr1CJRPtDXuxouADkENfahQv4flBUUorNz0BOrym5FcWUF+uV8aCaH+
         dubM2X98xAbfPw6KvfLQgX0u/OCIgeunNfMYkKXzs2bWCYQ3YyBn5jD1NfKRqhVvl20L
         O40OVQ6f9ws2KU+JJg0ELVsnO4sr31rvvlfujCVvHon7j8fu/njlsKe/AjwaKSSCpzwn
         Y3fufhOwuyBAnVybscwAb5ybe0AvLaWT1jpb/eyD1NMYkVnctEYtLgnIJWENmYzDKpEi
         dO1qgYxLEYex9e09krdiU5f5DrbdmLY/gcq59N3LDogxPw8YeSAYGRxDAsQxMmHgNv87
         kyWQ==
X-Gm-Message-State: APuU4Z+MRgZnPKM/m6nPOxbPeL7Ao/rah17lJtY4/wuDqlZ5gQc/fp87
	jVa5gLnnSKnwnThbDP1Mjl2m97E4FMxoH9ERabelyVeexUOjS+Gi+WXplVYIJ5CD
X-Gm-Gg: AZFdTZcQWXYWIhQBwtEXZnNbjXqJffhkKRFVG7SDgt6u2E5NDQ7SmQyaY2TTvJUvzWs
	0gWkJ79y4NcaarKzD48ScQvN3Fz+7AvxREhJo3zLRoPEdD6KBdm4YWU6vkzsTqzIUBB7gA7nswd
	aAva4iEgJHPeJwaslfDU7VgT8S4hsYviS6BNBdxIsoJJ5Sr473WKkG27zqXWMvvYW54B+bIfUg4
	UVMhiuiUtlFZs5bMjyOA7Av6F1xOup6X3U96J6JfjdNBGZDCHTS3TfheV7QN1756Uh2i8fgsNC8
	8Z1zuDG42woF9uGe9lTwRzZ/wHsb29/b2IF6DsnvBV3KkJzuDDmDL8S2KfMzqBXiOnnzTAE5I8H
	9yX2sJ22O2SX/Ez0opn67Bao68acA+lHA2Y2eJM8uYHQP4DpG2sq3ivHAlXosyGy4uy5jiMcbgi
	jIke5u7fJZQoW28ZbUn5JD/ynssk5+QxSRzEAbwBS9NzhjGZh8fj2f/OC1Uybq+Lslqj5YI8sF4
	vPaRm46J7pCPPnLMGpBb7ffvwNiUyfwVyU5KgqR8LD9Ybcnv52sja0mwLcMFd+02d6rWs3gJmRI
	Pmy+ZbdNfMdIdueYSnAumcu3KjF8l1UJ1dywC0MAGNeyMpa2/XmB6lcFnN+9gBFmtuRxZFFRcWg
	=
X-Received: by 2002:a05:693c:8204:b0:372:c0ee:875b with SMTP id 5a478bee46e88-3796057b529mr15977130eec.0.1794854559033;
        Mon, 16 Nov 2026 10:42:39 -0800 (PST)
Received: from localhost.localdomain ([38.254.175.116])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378c2fesm36893536eec.1.2026.11.16.10.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:42:38 -0800 (PST)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [PATCH] remoteproc: debugfs: use sysfs_streq() for write parsing
Date: Tue, 17 Nov 2026 00:12:30 +0530
Message-Id: <20261116184230.1885-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The debugfs coredump and recovery write handlers compare input with
strncmp() bounded by the write length, which accepts any prefix of a
valid command (e.g. "e" matches "enabled"). The sysfs counterparts in
remoteproc_sysfs.c already use sysfs_streq(), which requires an exact
match and tolerates a single trailing newline.

Switch the debugfs handlers to sysfs_streq() for consistent parsing
between the two interfaces, and explicitly NUL-terminate the copied
buffer since sysfs_streq() expects a string. Tighten the length check
to leave room for the terminator.

Truncated commands that were previously accepted by prefix match are
now rejected with -EINVAL.

Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---
 drivers/remoteproc/remoteproc_debugfs.c | 33 ++++++++++---------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index e8e7b6a3769b..ef6761a13c6c 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -73,19 +73,16 @@ static ssize_t rproc_coredump_write(struct file *filp,
 				    loff_t *ppos)
 {
 	struct rproc *rproc = filp->private_data;
-	int ret, err = 0;
+	int err = 0;
 	char buf[20];
 
-	if (count < 1 || count > sizeof(buf))
+	if (count < 1 || count >= sizeof(buf))
 		return -EINVAL;
 
-	ret = copy_from_user(buf, user_buf, count);
-	if (ret)
+	if (copy_from_user(buf, user_buf, count))
 		return -EFAULT;
 
-	/* remove end of line */
-	if (buf[count - 1] == '\n')
-		buf[count - 1] = '\0';
+	buf[count] = '\0';
 
 	if (rproc->state == RPROC_CRASHED) {
 		dev_err(&rproc->dev, "can't change coredump configuration\n");
@@ -93,11 +90,11 @@ static ssize_t rproc_coredump_write(struct file *filp,
 		goto out;
 	}
 
-	if (!strncmp(buf, "disabled", count)) {
+	if (sysfs_streq(buf, "disabled")) {
 		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
-	} else if (!strncmp(buf, "enabled", count)) {
+	} else if (sysfs_streq(buf, "enabled")) {
 		rproc->dump_conf = RPROC_COREDUMP_ENABLED;
-	} else if (!strncmp(buf, "inline", count)) {
+	} else if (sysfs_streq(buf, "inline")) {
 		rproc->dump_conf = RPROC_COREDUMP_INLINE;
 	} else {
 		dev_err(&rproc->dev, "Invalid coredump configuration\n");
@@ -211,26 +208,22 @@ rproc_recovery_write(struct file *filp, const char __user *user_buf,
 {
 	struct rproc *rproc = filp->private_data;
 	char buf[10];
-	int ret;
 
-	if (count < 1 || count > sizeof(buf))
+	if (count < 1 || count >= sizeof(buf))
 		return -EINVAL;
 
-	ret = copy_from_user(buf, user_buf, count);
-	if (ret)
+	if (copy_from_user(buf, user_buf, count))
 		return -EFAULT;
 
-	/* remove end of line */
-	if (buf[count - 1] == '\n')
-		buf[count - 1] = '\0';
+	buf[count] = '\0';
 
-	if (!strncmp(buf, "enabled", count)) {
+	if (sysfs_streq(buf, "enabled")) {
 		/* change the flag and begin the recovery process if needed */
 		rproc->recovery_disabled = false;
 		rproc_trigger_recovery(rproc);
-	} else if (!strncmp(buf, "disabled", count)) {
+	} else if (sysfs_streq(buf, "disabled")) {
 		rproc->recovery_disabled = true;
-	} else if (!strncmp(buf, "recover", count)) {
+	} else if (sysfs_streq(buf, "recover")) {
 		/* begin the recovery process without changing the flag */
 		rproc_trigger_recovery(rproc);
 	} else {
-- 
2.34.1

