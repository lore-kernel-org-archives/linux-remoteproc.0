Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D97200B99;
	Thu, 24 Apr 2025 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504891; cv=none; b=I9M2T9SG8CbnbBlaaSbnFWsNSMGECJ2eV7b3kc4sP6QT5FgtnSe8tQG0UdWPlovBYx68I8JVu4xCThaGdXR69juzKOuWEVoYWz5lMXtI8r68MQel1vIv3cQMQ9aF6/v/OTZgz+vYQkHxqCOvjpaF9+wfvVlD8M7BxpgEHMN5Mmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504891; c=relaxed/simple;
	bh=bBitGW2xjsasgYN7oIXDiESqi3t5WWL2pmVG3+5pVM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p48oyT4UIMhC6yWImtI6FGgL8SlFWIdRuzl7LjkExZYyezEeGDF+ueP7FvZvAta+OwIyYeTwBAYL5CjftgDJqXDYS0BlfzyaBFxoDjcxvqBqmCGRHSklkHk+NJF/hnasWWQdV+HiYLU3i99zELattTMjtTgRwdyNTsDhVAavNAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=HQixySPD; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="HQixySPD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=ETN3qpR4uGVMCaRHzMYIbaELv2dj5lLtmwCH4pVlo5s=; b=HQixySPD+0AuFwEc
	1/e5XeIwsNyh73iQy+StfHb71Fnxa3IU4PV8DTKQcpabfr3V0jjB5XaOXxFGaQMfzSpIV/TVjkI3C
	B69jpl28lKGCVwsrBL47vEhlP00oqUGudX1zZuDv6dqmeQv8stTS4KbLWoJ2X8VCfQ7qlUEvwsQyT
	QZuyslo2NOJC7Tv17/+7yJ8PDQNYpav+zEZwaTD51CKEVkHCiF0xunm/PYm4LwDV4is5NQrst2ksX
	BwDXdoqkVUMD1D+u9nAk6n34eZZAOS/QpjJIQcoKVVRQsrJjqV0p/XWknJ9FezcvHyBjhjlPEbglA
	V+U/iJejW3+Ce/s1Cw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u7xYI-00DdIX-33;
	Thu, 24 Apr 2025 14:27:46 +0000
From: linux@treblig.org
To: arnaud.pouliquen@foss.st.com,
	andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: corbet@lwn.net,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2 0/3] rpmsg offchannel deadcoding
Date: Thu, 24 Apr 2025 15:27:43 +0100
Message-ID: <20250424142746.79062-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Hi,
  This removes a couple of unused functions in rpmsg,
and (v2) after discussions with Arnaud, follows the thread
and removes code that they would call.

(Build tested only)

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (3):
  rpmsg: core:  Remove deadcode
  rpmsg: virtio: Remove uncallable offchannel functions
  rpmsg: Remove unused method pointers *send_offchannel

 Documentation/staging/rpmsg.rst  | 46 -----------------------
 drivers/rpmsg/rpmsg_core.c       | 63 --------------------------------
 drivers/rpmsg/rpmsg_internal.h   |  6 ---
 drivers/rpmsg/virtio_rpmsg_bus.c | 22 -----------
 include/linux/rpmsg.h            | 22 -----------
 5 files changed, 159 deletions(-)

-- 
2.49.0

