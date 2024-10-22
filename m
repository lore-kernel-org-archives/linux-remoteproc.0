Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57675200CAF;
	Tue, 22 Oct 2024 21:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729632932; cv=none; b=GevwmbpyybFqpCDNaIsFFDihYwY7W7A9I1MnOqFXBTbGnjl8hiCW0IaIvHnq7qJIMPz+l2+PU+lpmMyPDNNnVUWHjQCioPeATO57gdyklZbvTQvXxWbwGhJWCcu94HGeOX8VRIGBtjmOqNXyq4uVUdnhk3VE7shQpJLLxpbvrVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729632932; c=relaxed/simple;
	bh=oupMMCevCANOEJ/x0t7nUEeAcGmBvhsy7DMi0FF34Po=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Oh6YJeHrKGDjeyU0S+Z0svFNOGFwAgZ5ZExUS/m7jrbH4v5DlYhnFFP++hFPowkMcGRlGDaCDLtm7r3caZDb7vQF7ZAvWN0sYKhkX51VX0/al4aFA+BbfK3tgBn90pqxn+RAGBUkxiq6w4hyW+JHblZ2sSn+Gawhf2KljJltXgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Je3Jfcwq; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Je3Jfcwq"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e30fb8cb07so4461831a91.3;
        Tue, 22 Oct 2024 14:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729632930; x=1730237730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yveh/RP4/RFoq633tQIwSkvGafOVfAL4UOgy/qRPxaA=;
        b=Je3JfcwqJB2+4aa2k9WtrhrmZWUpvxzox2MPhpI1BelQrcBXqH8Ta/Egi6Dpgp2Ght
         EVXQpLK1rzeTYRmn5bw1ROI5gRROEngcLf18Hkb7EeWIyUGdTa5cZ7zvmD/veBDUfNIZ
         1w8KmKQ0fQM/6qO/103//mUboajXtKSQuiBh2SAicNjjVGl6SpvPLRvzQ1WsrzYSPVzv
         Pw1htDab7EJ43qW7Q8VqsaPV5ZQsaIUnpWDqkXUVAAVkLTpDp/dPE6Yjg+QKUBc/BvOA
         9ofjm4A5Akq+NaZ/cb+/IcK/033+IelWsTG1TtyXB7Zr3F8/vUWGC/RRN5M1IiB0RSo6
         ZAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729632930; x=1730237730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yveh/RP4/RFoq633tQIwSkvGafOVfAL4UOgy/qRPxaA=;
        b=aOum9RpOBkuvrT6iOEm3eTOcrKvYp85zrw0fpDZdS6GFkGKZcgMlTczaA1zD9N9e1P
         TyNWocO/5NBslg09qCeKpNznB1DIOERPlZ29r4zgNt85R6iF+acpeAFPYLXzLl6iza/r
         2v9AgvZKMVTk8jBk5G0ch8WfwPxbICGZkw6VgF0vGaXkem7MViLkfMpZNViPl377MRHj
         kAkt0RLMIqv/kNtFZT8G1FveJOlbWvZ+9FCB9+AKjVE5ODT9LKqZsTF4l4sOMo0MCtUb
         j9iz/0Gz2tGppKxRLzSI57y5uW0j0j4FHDCxybwBI9CV1Sc9IVod+TEiKYzOeUVz+uAX
         l2KA==
X-Forwarded-Encrypted: i=1; AJvYcCUv+m8y1+j+lLlLFjs1WfxWjXWz2HtUsPKrl1/NSjVqZoPM8psKXpp4Usb050H0Hk6zLeJ/acASPZwsxxx/@vger.kernel.org, AJvYcCXvUQwuOsqcXlLv2sy78i9oIm2taYv+TOpIDAnvwkttwO8n6k9E0HtsAPdrqrbPG7RTlDwItmfFAC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf0ErZGmHh6geXSFa03Cnh1Q8j+VDpctpcpWQZ9LuDKMLA4GjP
	I5tK4mZInIjiBYMPMnsm3WkvWsj2ZVAhhdnrkQNf9x45sbZm9MWz
X-Google-Smtp-Source: AGHT+IHaFyahdrsyUVs3OCfK6Oz7muS9yWz/K06pAToapxxyyL8lo+n/NRgaxS9JywYsl8PJJGRG4w==
X-Received: by 2002:a17:90a:b89:b0:2da:8c28:6561 with SMTP id 98e67ed59e1d1-2e76b618c4cmr393517a91.22.1729632930556;
        Tue, 22 Oct 2024 14:35:30 -0700 (PDT)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:1c93:3e9d:2c84:d5f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ed73fsm6726369a91.44.2024.10.22.14.35.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Oct 2024 14:35:29 -0700 (PDT)
From: anish kumar <yesanishhere@gmail.com>
To: ohad@wizery.com,
	bjorn.andersson@linaro.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH 5/7] Remoteproc: Documentation: add userspace api
Date: Tue, 22 Oct 2024 14:35:14 -0700
Message-Id: <20241022213516.1756-6-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241022213516.1756-1-yesanishhere@gmail.com>
References: <20241022213516.1756-1-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add information about how userspace
can control the remoteproc framework
and different ways to do that.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 Documentation/remoteproc/index.rst          |  2 +
 Documentation/remoteproc/remoteproc-api.rst | 75 +++++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/remoteproc/remoteproc-api.rst

diff --git a/Documentation/remoteproc/index.rst b/Documentation/remoteproc/index.rst
index af3573123ee4..243b5652cf79 100644
--- a/Documentation/remoteproc/index.rst
+++ b/Documentation/remoteproc/index.rst
@@ -18,6 +18,8 @@ Authors:
    :maxdepth: 1
 
    remoteproc
+   remoteproc-kernel-api
+   remoteproc-api
 
 Mailing List
 ------------
diff --git a/Documentation/remoteproc/remoteproc-api.rst b/Documentation/remoteproc/remoteproc-api.rst
new file mode 100644
index 000000000000..548d3658fc1c
--- /dev/null
+++ b/Documentation/remoteproc/remoteproc-api.rst
@@ -0,0 +1,75 @@
+==================================
+The Linux Remoteproc userspace API
+==================================
+
+Introduction
+============
+
+A Remoteproc (rproc) is a subsystem for managing the lifecycle
+of a processor that is connected to Linux.
+
+At times, userspace may need to check the state of the remote processor to
+prevent other processes from using it. For instance, if the remote processor
+is a DSP used for playback, there may be situations where the DSP is
+undergoing recovery and cannot be used. In such cases, attempts to access the
+DSP for playback should be blocked. The rproc framework provides sysfs APIs
+to inform userspace of the processor's current status which should be utilised
+to achieve the same.
+
+Additionally, there are scenarios where userspace applications need to explicitly
+control the rproc. In these cases, rproc also offers the file descriptors.
+
+The simplest API
+================
+
+Below set of api's can be used to start and stop the rproc
+where 'X' refers to instance of associated remoteproc. There can be systems
+where there are more than one rprocs such as multiple DSP's
+connected to application processors running Linux.
+::
+   echo start > /sys/class/remoteproc/remoteprocX/state
+   echo stop > /sys/class/remoteproc/remoteprocX/state
+
+To know the state of rproc:
+
+.. code-block::
+
+   cat /sys/class/remoteproc/remoteprocX/state
+
+
+To dynamically replace firmware, execute the following commands:
+
+.. code-block::
+
+   echo stop > /sys/class/remoteproc/remoteprocX/state
+   echo -n <firmware_name> >
+   /sys/class/remoteproc/remoteprocX/firmware
+   echo start > /sys/class/remoteproc/remoteprocX/state
+
+To simulate a remote crash, execute:
+
+.. code-block::
+
+   echo 1 > /sys/kernel/debug/remoteproc/remoteprocX/crash
+
+To get the trace logs, execute
+
+.. code-block::
+
+   cat /sys/kernel/debug/remoteproc/remoteprocX/crashX
+
+where X will be 0 or 1 if there are 2 resources. Also, this
+file will only exist if resources are defined in ELF firmware
+file.
+
+The coredump feature can be disabled with the following command:
+
+.. code-block::
+
+   echo disabled > /sys/kernel/debug/remoteproc/remoteprocX/coredump
+
+Userspace can also control start/stop of rproc by using a
+remoteproc Character Device, it can open the open a file descriptor
+and write `start` to initiate it, and `stop` to terminate it.
+
+[FIXME -- better explanations]
-- 
2.39.3 (Apple Git-146)

