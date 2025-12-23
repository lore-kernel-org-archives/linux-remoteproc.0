Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B206313277
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 22:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766528012; cv=none; b=LjsmnrDHrVew9AnwjhJjnzWSR6erIEx1kJXyIKSD0tUfWuYp0p+rCOLFy9ZaP1IVRtaq+9jCxhs7YaorESjsb01pAFX9JoygrbS7Vi05DFvp1KO9LCxPzKaih9Gusdd6EGqI+iR0PHoo3DG2JE7Pfx6Vum548pkqqNNkIY2FjUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766528012; c=relaxed/simple;
	bh=sMUBMbrK7/ZzTN2ifHo0idjCHc3u2IqyKo1PdHLi5oA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m1jCYFxPTa31fxQTjesdVl9rTkgYU5Io15qGHtpyJQc/a2nqW1Bu2SxWln/F1f85T5AmQZUeRuqchHJTTjwJBhVT6LgnLHB0Ua3JOBqUJ/24DDinycSda1O5NuUt3idfs+Gg5T+HhxXdH7p5hk920Pb20sbHol86b2AMj/s2noM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARsk4y2L; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARsk4y2L"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c565b888dso6005666a91.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 14:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766528011; x=1767132811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qbMxF+gY7bPHqJ8ldPkOL73xrNsVRUkggRkHgQFozfo=;
        b=ARsk4y2L9vKJ/C6xcHRJVa1W35aenPVGMU5cLNJO4hcrtFuL6Mfx7IWoynZyG66G1N
         VK7IAWxGn0+9WG9pxWE9blQijIKVUUjPlBpB2EvXwMoc+3TZbAu6JRLzUyL6CfWbeJb5
         PCRBZmutep+HFqlZ6UYxHgTp1E4fF2evtDOmHm9pb3vf27iagEIZ6L2S3IarHbiBmzCe
         Nh3n3ZXYytZa40+0wN867AaVxVZl3nHSg2qHZ8PTi3pqge0WPiiJClIRAzDLpTBm5XMU
         yfUaYFJef8Q9dxCfrdUhac8aPwUNTOch97nrEuOGu/cimp95exUn/SCBVtFP0MIlYc4I
         RONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766528011; x=1767132811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbMxF+gY7bPHqJ8ldPkOL73xrNsVRUkggRkHgQFozfo=;
        b=AeGi3zvqcSePK8dcXlPtOzcSVV7YQPkN14da45BKeF7AD/P5+4VXqYukaSWC9gqS/v
         LB2uBuZR/aeqjv7UjcqsE+PptZc0/j35VSxvhLadjTrZ6ddJ6CsSTsBkm1d3W/BC0j6g
         cpDxX0yVJ5TEwTVrBUy7HBAy32cLCWornKnwXAWoIAFJoQfHlBIUeE2jM+0kPpc28+H2
         x+xIOh0JpPY4bA7O6ygw7clIJ++ETJnm6qBmxI4oEFbybcc+ClDMHYQ8OsEi6vzJjV0t
         lmy15thIIQalpMN1rYHbMYjrPnZ6c9urir/+UfJLg/AmOsxv4jJxp8bhzNuASjo97VGo
         B4RA==
X-Gm-Message-State: AOJu0YwTp4IeH5Ye/EZvLAjO1GZ5aFZ+yRZcMGd5CisF7bBLD0FL14+2
	uxiQNvf85BnAGCOE5ME03fl+484TrhYgLF6W1Q5owrGef/IgsQgdyoAt
X-Gm-Gg: AY/fxX4L5PWFAOQgEw+/S7KhHqfLHh64wDPUo2mC3MjJbwQsivhqwk056fHxRzb9RoT
	Suf2VwfQ9ueW5Sfv9HhBT2PfkMFZAHTwHISyTtYjkni7xhLZZaUe48UIZ35Sgu5Q+IJmY3A114V
	plnw/6fMZJu439HW/hQNgiLSel5rXsALUKjF5nWUEyxowVD+l2Clf6VME0KRCs2nzkhOCHn/uz4
	n81wn47ugs2zH9Bq9y81gx2Eglx89d5RrsCBOjqA/3Rv6n5cryx80B9I9G6/JwrOyFd5hS/UuDn
	Bpj2UELb2r1E4h7XWG3lOrE0lbi0NCBbIIFO3aRV/pq0WRTxa9mJClwXkiYx10ci+ZrKFKCQERH
	/UdOSgpqv9eC93hsm/N3QpJJADi/efVkVExvVFHKefiRNpFJdRS2jf+s+tMOI3ByhBner3eST4e
	wluoqybuvbd9gZ8NlQJ/aHU0oW5GhwM41pQKXOiK+KAQ==
X-Google-Smtp-Source: AGHT+IGikOIURWcD46OTUx3VcgjIsTTbayXLK7FFPsek16ZYnMoDIlgfP2L9P5rmA4oZ7WKOU3FoVg==
X-Received: by 2002:a17:90b:1f82:b0:340:ff7d:c26 with SMTP id 98e67ed59e1d1-34e921557bamr14728161a91.16.1766528010571;
        Tue, 23 Dec 2025 14:13:30 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8838:aa50:ded0:d1bf:9b7c:5ce5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d65653sm16742889a91.5.2025.12.23.14.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 14:13:30 -0800 (PST)
Received: (nullmailer pid 28846 invoked by uid 1000);
	Tue, 23 Dec 2025 22:10:36 -0000
From: Kathara Sasikumar <katharasasikumar007@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, shuah@kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, Kathara Sasikumar <katharasasikumar007@gmail.com>
Subject: [PATCH] docs: dt-bindings: remoteproc: fix Keystone DSP GPIO binding link
Date: Tue, 23 Dec 2025 22:10:20 +0000
Message-ID: <20251223221019.28823-2-katharasasikumar007@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make refcheckdocs reports a broken link in the Keystone remoteproc
binding documentation.

Update the reference to point to the current YAML schema.

Signed-off-by: Kathara Sasikumar <katharasasikumar007@gmail.com>
---
 .../devicetree/bindings/remoteproc/ti,keystone-rproc.txt        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
index 463a97c11eff..91f0a3b0c0b2 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
+++ b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
@@ -66,7 +66,7 @@ The following are the mandatory properties:
 - kick-gpios: 		Should specify the gpio device needed for the virtio IPC
 			stack. This will be used to interrupt the remote processor.
 			The gpio device to be used is as per the bindings in,
-			Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
+			Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml
 
 SoC-specific Required properties:
 ---------------------------------
-- 
2.51.0

