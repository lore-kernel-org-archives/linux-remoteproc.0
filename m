Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9A83B0593;
	Thu, 30 Jul 2026 05:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785389374; cv=none; b=UrNx8tqtUflg79dv0IRUmBeyMrhZxTiw/VZ2FuvnVNT4MV35fCcvUaBH3iEgS908pnO7khea2d3nZdkLAy8UupuQNxnVUwC38HzRwp0zenc0a0A4dcZJ0QM8VwSaVcZCe+fIqMfyfBv9A6SgpDahaaVUJnIogQzw6MVLYA/c4Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785389374; c=relaxed/simple;
	bh=fbJ/hTp3doLqwpnr+51Xin5AeLbGqM6Exc6oBQoyfBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i6y9FQgIqa9clDCy6sQAGFX2knMkPX69djWRq96zoVbs1nDiLCqxyIdogV9i5Ke+dn0XrP2C0W6pRZsaKzHGdH3TMR9PjZ/x4uvMViJu2iEm690v0i/xIzqAdtjhPHwGU10bRqwvpS+0ydiWd0kpbhnmSxadpfJcnmBpqIq4WGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uvv5B8Bq; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uvv5B8Bq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=mHuGS3K7174HGIP5H6iGeSeutbmyYP+rpE5H3MDMVZE=; b=uvv5B8Bq3qdH36TgLsAMKwOICz
	WhcLQEzTfA/h8udO0HfP3x03Ltd2mSuzhRrvThqX+j+l3nVoQhW2OWJJjh4B78YXQU5F6cXjQlCJb
	X5OBHNhDA8eLffQAktrC2jSOD5Cn7xkZuQVBvaD3rADusu55u/nKo1gmnk4fN1m5JlbJZ67Rp3V7u
	zvpmIhiQjXdRkiu0J93A0MrmrDSGSsE0WygpdfsAGuBIOc8ZwWkM+L1DMw3R4zrNIOkHjTSRs3iw6
	720KAp01o9RFR+GKiaoBDu7M4ZLNPgOr4jz+Nr3N5sNSZtZLqeV5C+OVjX4z/anF8XKDElSW57Vom
	9T/w/QQg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpJKc-00000009YAn-4Apa;
	Thu, 30 Jul 2026 05:29:23 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH] rpmsg: ctrl: use kernel-doc format for ioctl macros
Date: Wed, 29 Jul 2026 22:29:22 -0700
Message-ID: <20260730052922.1610116-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ioctl macros to kernel-doc format to avoid kernel-doc
warnings:

Warning: include/uapi/linux/rpmsg.h:26 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Instantiate a new rmpsg char device endpoint.
Warning: include/uapi/linux/rpmsg.h:31 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Destroy a rpmsg char device endpoint created by the RPMSG_CREATE_EPT_IOCTL.
Warning: include/uapi/linux/rpmsg.h:36 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Instantiate a new local rpmsg service device.
Warning: include/uapi/linux/rpmsg.h:41 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Release a local rpmsg device.
Warning: include/uapi/linux/rpmsg.h:46 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Get the flow control state of the remote rpmsg char device.
Warning: include/uapi/linux/rpmsg.h:51 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Set the flow control state of the local rpmsg char device.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org

 include/uapi/linux/rpmsg.h |   15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

--- linux-next-20260729.orig/include/uapi/linux/rpmsg.h
+++ linux-next-20260729/include/uapi/linux/rpmsg.h
@@ -24,32 +24,35 @@ struct rpmsg_endpoint_info {
 };
 
 /**
- * Instantiate a new rmpsg char device endpoint.
+ * RPMSG_CREATE_EPT_IOCTL - Instantiate a new rmpsg char device endpoint.
  */
 #define RPMSG_CREATE_EPT_IOCTL	_IOW(0xb5, 0x1, struct rpmsg_endpoint_info)
 
 /**
- * Destroy a rpmsg char device endpoint created by the RPMSG_CREATE_EPT_IOCTL.
+ * RPMSG_DESTROY_EPT_IOCTL - Destroy a rpmsg char device endpoint created
+ * by the RPMSG_CREATE_EPT_IOCTL.
  */
 #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
 
 /**
- * Instantiate a new local rpmsg service device.
+ * RPMSG_CREATE_DEV_IOCTL - Instantiate a new local rpmsg service device.
  */
 #define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
 
 /**
- * Release a local rpmsg device.
+ * RPMSG_RELEASE_DEV_IOCTL - Release a local rpmsg device.
  */
 #define RPMSG_RELEASE_DEV_IOCTL	_IOW(0xb5, 0x4, struct rpmsg_endpoint_info)
 
 /**
- * Get the flow control state of the remote rpmsg char device.
+ * RPMSG_GET_OUTGOING_FLOWCONTROL - Get the flow control state of the
+ * remote rpmsg char device.
  */
 #define RPMSG_GET_OUTGOING_FLOWCONTROL _IOR(0xb5, 0x5, int)
 
 /**
- * Set the flow control state of the local rpmsg char device.
+ * RPMSG_SET_INCOMING_FLOWCONTROL - Set the flow control state of the
+ * local rpmsg char device.
  */
 #define RPMSG_SET_INCOMING_FLOWCONTROL _IOR(0xb5, 0x6, int)
 
