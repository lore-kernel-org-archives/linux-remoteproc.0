Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7553914A09C;
	Wed, 23 Oct 2024 05:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661654; cv=none; b=iqIH14f6/LlyBFoEtHlynt7Wi9aJc0l0sGR1ROuGySFmtqYhc+TziyTAWk5oD3p+n8Q06+snqeW80JnHa14irUuIwOi3WxWlU+BthKHcbnhqeYQSAUPAdj3ZHzbCbRkHimcOPbN9s195kufgSM6v0B8AEHPwjHTNPoukHApgyvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661654; c=relaxed/simple;
	bh=uTAW3pkWYe+GuE2RBQ/1OUtIO/ENd2+9Ewakwcbcsaw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gFoA8yI5cOsBv8LQMEjoIWk7BySUm6ZDEQppwDWOL+Ns9K0puASEzWrQCyAolD26c9kOSa3Sod5OVNMMHB3yVhtSuP7CwsbDFiS992c8cPBKgm3eKs9KsA2zxH8/jmPDN48extpXohezeONJ0gbBTx58DUV1HmZYTG56pwBcyc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEbCnGJi; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEbCnGJi"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e3fca72a41so4390449a91.1;
        Tue, 22 Oct 2024 22:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729661653; x=1730266453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4rRoXjGVEerACUHjG3hf4rLkB65lTUBBhdOo3L4OOE=;
        b=DEbCnGJiJ6guVZI6VF1+AkOmO8yNkGCB11o3lVfHHwzGDVE6ENPABNiqIXwsgyUlRc
         LROEhB9uG5CiuRtkNFmmT0nkO7cqfwhEF6fvV2/1SyCou6jf595u+uavPoTxjkI3dJXS
         8Srd5SreqewwvtHAiYVaVcx07EWHewnAwnUg1vkGojrz+7WHKtL09M+1WrdfQVt3WVQq
         DH+nhqj24m+qTefQ8OzNmzAvJE0Sjus95GewbVupdGYe+qXnAjdAdY1z0FsZTKrwe/Np
         XSJnK9ywiGW8oHgn2LQgmWSSK+jS2K+55mepUX504yoBa42arODtLvpgRGekvrKDBPW6
         MpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729661653; x=1730266453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4rRoXjGVEerACUHjG3hf4rLkB65lTUBBhdOo3L4OOE=;
        b=ugiDYanVNF58ZOqVH5nyQfLoH0sOg76nmuhJaz8y3WOSjLemNSiKVRtzY+2n1iNQKA
         3yykED/bPTvcgNqKmTHejwCdtsQPRCZL+39clxk3gCPqmJCxVyeUPxULJalUxq+YphQj
         1tZ8rlywBTpuLVFuRXWTmius6sXnzgAQLkm1vhNsNGL2bFIUOWRDCKdyxr8LXoxTaWGg
         v5/OdpJmAKgwHrODWs1X15rD0VrFmNtLzQpqVQGgYgw2Kc4T2V98Wmrj62D60VrT8VpB
         RB0kwypWe982vK8BOl7B6WA7hHqtV9aYt85fIPJLXBwAFiWmf8+ez8Zdm9iI0qYCIixh
         r4lg==
X-Forwarded-Encrypted: i=1; AJvYcCU6Sv+Ei74bhWwjbrLXD0LxpLe5tv+9vZLCL3hlyJoFpRMFhafmgXm1w0Bt1/Pq5D7xbaaTb6xiR7g=@vger.kernel.org, AJvYcCUUDF+KfghOgFMYRaXbqq4KrAyOlt0C5I46l66SQKaCR1Jnfi9BRx37QnJPaZ8uq5/LMLGrkX6nmyEe2vuU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6PBuMlToNuC6owyifQJXhWzaSUqZ+O5TnSP7ZQUwgQH+WUFHT
	DIYfHdN6nwQ7+1oRpkmTByPo3nkQEL/MOd47E5wgil2siwPSfXPX
X-Google-Smtp-Source: AGHT+IFFrs4AhOv4uU0T3PYddUDmXOS8TMkOBlzXFG9cQpqCYBKrekzzHBF92EpgQ2XMGN6LuVsxiA==
X-Received: by 2002:a17:90a:e681:b0:2e2:a6ee:9280 with SMTP id 98e67ed59e1d1-2e76b6ea2e0mr1494906a91.26.1729661652631;
        Tue, 22 Oct 2024 22:34:12 -0700 (PDT)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:1c93:3e9d:2c84:d5f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76e0877a6sm428695a91.54.2024.10.22.22.34.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Oct 2024 22:34:11 -0700 (PDT)
From: anish kumar <yesanishhere@gmail.com>
To: ohad@wizery.com,
	bjorn.andersson@linaro.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH V4 5/7] Remoteproc: Documentation: add userspace api
Date: Tue, 22 Oct 2024 22:33:55 -0700
Message-Id: <20241023053357.5261-6-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241023053357.5261-1-yesanishhere@gmail.com>
References: <20241023053357.5261-1-yesanishhere@gmail.com>
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
 Documentation/driver-api/remoteproc/index.rst |  1 +
 .../driver-api/remoteproc/remoteproc-api.rst  | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/driver-api/remoteproc/remoteproc-api.rst

diff --git a/Documentation/driver-api/remoteproc/index.rst b/Documentation/driver-api/remoteproc/index.rst
index 7fa1c5755be8..840b4672352b 100644
--- a/Documentation/driver-api/remoteproc/index.rst
+++ b/Documentation/driver-api/remoteproc/index.rst
@@ -20,6 +20,7 @@ Authors:
 
    remoteproc
    remoteproc-kernel-api
+   remoteproc-api
 
 Mailing List
 ------------
diff --git a/Documentation/driver-api/remoteproc/remoteproc-api.rst b/Documentation/driver-api/remoteproc/remoteproc-api.rst
new file mode 100644
index 000000000000..0306b331a20e
--- /dev/null
+++ b/Documentation/driver-api/remoteproc/remoteproc-api.rst
@@ -0,0 +1,77 @@
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
+
+.. code-block:: c
+
+   echo start > /sys/class/remoteproc/remoteprocX/state
+   echo stop > /sys/class/remoteproc/remoteprocX/state
+
+To know the state of rproc:
+
+.. code-block:: c
+
+   cat /sys/class/remoteproc/remoteprocX/state
+
+
+To dynamically replace firmware, execute the following commands:
+
+.. code-block:: c
+
+   echo stop > /sys/class/remoteproc/remoteprocX/state
+   echo -n <firmware_name> >
+   /sys/class/remoteproc/remoteprocX/firmware
+   echo start > /sys/class/remoteproc/remoteprocX/state
+
+To simulate a remote crash, execute:
+
+.. code-block:: c
+
+   echo 1 > /sys/kernel/debug/remoteproc/remoteprocX/crash
+
+To get the trace logs, execute
+
+.. code-block:: c
+
+   cat /sys/kernel/debug/remoteproc/remoteprocX/crashX
+
+where X will be 0 or 1 if there are 2 resources. Also, this
+file will only exist if resources are defined in ELF firmware
+file.
+
+The coredump feature can be disabled with the following command:
+
+.. code-block:: c
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

