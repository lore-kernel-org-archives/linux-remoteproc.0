Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3B130E820;
	Thu, 19 Jun 2025 18:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750358501; cv=none; b=YRd57y5doeuRndNJHFhcjhihYxwHWhJ3H/ltZpHzcx8T3thzHO5Ayf+m+r7nZ0A/ULB3QmeQ3uY7nj8spkOKp4Yses0kjFfi00fY7y1lzpVbiakJxb4IkvZsvp8BsgN5g6wd+DIs4tcwqENg0n/gYNlaRPVgTn+zJEMxv1UX1BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750358501; c=relaxed/simple;
	bh=jBskGNoHA+9JoOIC4IUuYF7+SUyDSi5au3re25A/7PA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NZQDJiwiNl5dwfZKus2xyI8YCiYjilDI3NEkTGvlxBI+WY5GoplxLtdb92LIL4GCbRea5noJSMGRqubfE/lMH1Xzw32ZBmauqvDm4PTJo4CM8J2XzkWdmsFlYEVozWpeXC4X6tDatjx/LLTJZFR2BzNWOWGLPxbC1CjAMY/G2xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+fuXz+9; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+fuXz+9"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747fba9f962so778798b3a.0;
        Thu, 19 Jun 2025 11:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750358499; x=1750963299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EwmvwTRpkQPUijB0LHYDdIUdHccN8yCN4LwHVdpv7TY=;
        b=l+fuXz+9DYjz7f7F1xdTBmTXk34KMZm1gQcAa5Yi7RDQq0hJQQCzvwbajNtXt0g9go
         pfnaYbce7qBIwKlTf06vKXozQWlw22PGgq2ZrNGZWvOGrQ3exIxqyUkEKVl1MXN/99n2
         waPXDLhrRYvXJrLCDtTpf+P7rYrS7WPXxaFkcPqGBP0ANKfedKuUz/mat3CDxk3vuTWe
         51l/+jxtfmNJWs7DaCoZLZNC2m3iCEl+n0s94ihRGJ2HNQtBut9dSVTYrXKgg87VkKO3
         pbYcc5Zqz1aUKrAgbSG7u+cbekb9oglKLVXcZXRhGcJLzpTFWTQenAm9dGx12K3n8gJ7
         16RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750358499; x=1750963299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwmvwTRpkQPUijB0LHYDdIUdHccN8yCN4LwHVdpv7TY=;
        b=EoiSCZF+tmHXNIKVg1zkp7i1tt2iZq924FcweoJ+Pa1R9t7kMw6Ziq3N1hwoSMgqVQ
         8dL3bIvknTkUnzvOKkw/BdYMlD/gmBEof3c3IHbQ9LxDHN/lNmM1enPU6BuGsfb32NvQ
         81/dG40WgMETVcscA7SsVYAcqPrrxmeMrYUK1IIfqlVkqKgzwPHufHV98hG7QqdklbN+
         SG4BTMj+kkeknDQU+eFgPOOXDDz4s2ahNr6TVmMxqg6bpdagj1utPjcPe0SCNZZL+om0
         KtcbHS8g4V7zwcPJKwW4TLjmzII2teCYfvdUjkO+IF7L/DaVTndYsHrIIpNiEDs0GJGF
         57SA==
X-Forwarded-Encrypted: i=1; AJvYcCWbPEDRECzKPvbTr4aTziX1rhZrxPRNT1N9Agp2/wulq+Hv+uZu/4uOsOYHg31LP0W8DgV2bWehBy7aCG8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0+BuaO7IJQFoPsuX9Dv90xsiWNftcQH1MZBcYZR4WtKEfZPDJ
	qig6Z5BF6/k50Z+/MBsEfMOFqEUcPZhWDpqPp8c0UXQITaLY1V9k0aNG
X-Gm-Gg: ASbGncuN9cgmmiID5Z/nBkwZ8LDTOMIxs8TWIg3XHnjIV+l3NIqMR7lCwkZ77hpx8ks
	ZUQXJeRk6epynZZQqO8LtuPd4wA3UzqyIv2uHjXF4P4QNyvgcECqJ2IHmgSYN6nkXqltUSZxXV5
	ZNVMdTu0C9w/2DFpJTfL5UwfikJjPtiFsbRnR5AEmJP7ZbiKikjG2YPSMbUVpBx2hc/bWZdaRnQ
	xZUPVdKDj0qACbOVNQ4V0PsOjtvKk9Lqp5NO9BlLpd0PjtQbhPloTRFuRHP+tYECHPBIgGh3AD/
	KnBL4rqaOzrEf338GFPBHJwoUe1EjGqLAC3gbmtDJ1b7q3d69pjbzN4DxMPdL4AQ
X-Google-Smtp-Source: AGHT+IHv/tFK3ROe8PYuEUhYe2fYFxocaMzqFJs10rbPeRFIloxlXaocmimW8QZJY9LXrB7mtNK0NQ==
X-Received: by 2002:a05:6a00:4791:b0:746:1d29:5892 with SMTP id d2e1a72fcca58-748f77c0787mr5087362b3a.4.1750358499469;
        Thu, 19 Jun 2025 11:41:39 -0700 (PDT)
Received: from pop-os.. ([2401:4900:1c94:78d8:7a8c:ca7a:2a3b:1f0f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46b8c8sm400081b3a.18.2025.06.19.11.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 11:41:39 -0700 (PDT)
From: Abhinav Ananthu <abhinav.ogl@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhinav Ananthu <abhinav.ogl@gmail.com>,
	Abhinav Ananthu <your_email@example.com>
Subject: [PATCH]  remoteproc: debugfs: Replace scnprintf() with sysfs_emit()
Date: Fri, 20 Jun 2025 00:10:52 +0530
Message-Id: <20250619184051.95066-1-abhinav.ogl@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the debugfs show() functions in remoteproc_debugfs.c to use
sysfs_emit() instead of scnprintf(). The sysfs_emit() helper is the
preferred way to format sysfs output as it ensures the output is
properly bounded to PAGE_SIZE and simplifies the code.

This patch addresses three instances of scnprintf() usage in the file.

Signed-off-by: Abhinav Ananthu <your_email@example.com>
---
 drivers/remoteproc/remoteproc_debugfs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index b86c1d09c70c..691fd523e0b5 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -46,8 +46,9 @@ static ssize_t rproc_coredump_read(struct file *filp, char __user *userbuf,
 	char buf[20];
 	int len;
 
-	len = scnprintf(buf, sizeof(buf), "%s\n",
-			rproc_coredump_str[rproc->dump_conf]);
+	len = sysfs_emit(buf, "%s\n",
+		rproc_coredump_str[rproc->dump_conf]);
+
 
 	return simple_read_from_buffer(userbuf, count, ppos, buf, len);
 }
@@ -135,7 +136,7 @@ static ssize_t rproc_trace_read(struct file *filp, char __user *userbuf,
 	va = rproc_da_to_va(data->rproc, trace->da, trace->len, NULL);
 
 	if (!va) {
-		len = scnprintf(buf, sizeof(buf), "Trace %s not available\n",
+		len = sysfs_emit(buf, "Trace %s not available\n",
 				trace->name);
 		va = buf;
 	} else {
@@ -160,7 +161,7 @@ static ssize_t rproc_name_read(struct file *filp, char __user *userbuf,
 	char buf[100];
 	int i;
 
-	i = scnprintf(buf, sizeof(buf), "%.98s\n", rproc->name);
+	i = sysfs_emit(buf, "%.98s\n", rproc->name);
 
 	return simple_read_from_buffer(userbuf, count, ppos, buf, i);
 }
-- 
2.34.1

