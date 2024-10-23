Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37301465BA;
	Wed, 23 Oct 2024 05:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661648; cv=none; b=JMpJFvvHpYleVNIlPaqLgt+/zg+zSHLwNmIbWmh9M7e5ydUBCaybfyzcd3kEzKpwYv3BFXZAlCztED6OJL0n842haXGUTWX3kYq86FCw20Lc+UtvAfWlp+NUqllxnPJVlSUYPRFIhbyTh+QMfaJawV39iwFxhr88qRPqA8FTQSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661648; c=relaxed/simple;
	bh=F9wyVBaF0oSJbY/ZwpGmuvQ3WfCyLVP5YNotULhlD4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qjxeZ7Lf3zuFG69xkQKOJs5Cw+DT71eVP9HcFdN2/mhdJE5XRI8dGEGjXy0tPBcef/NGgxcjPK92AY96JBTpyFSPCV5a7BGcTvAMszm0Cq62l7QIAvcYvVxwXus/oiLGdmLjCyKOM7Vv7DsubK0KhrdKsFPAmInniI04Eb6i5zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtWb+2Sq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtWb+2Sq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso4184036b3a.3;
        Tue, 22 Oct 2024 22:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729661646; x=1730266446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4H28hFRgfMxE6n6xvKEknwZOvdBzOexKEGHxbARteQ=;
        b=YtWb+2SqtQA0ZuYLG1tWshZIb+sqv4+E/f8YYw6/VkvOPkkK/cAVCtiwc2b3EjBHqo
         zQLCa4tVwMi8mBSxxnhLHtFm+9FUwb19Bo13q0MLj940Aho4G8KgJgcZ2GGTGTpbDswT
         AAlP3L3mzKQzChUD5pqAtXaeO3Dajx9JW09LHYwtU64iFzPr+ZXPd+T9zm9b8LMQ7w8C
         NWEwOr/dnvh4xsJhQaa/DqIy9C3xZ+HK0OsPx+8rc6/wKWxjW51PZT67les5eQkoGdmV
         uSxflEgEW4SQ6vzKyrC7yLrn9uyUuNEVpnwWckbzH107R7hGi9ucS4w4j83VyQH5yTly
         ZmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729661646; x=1730266446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4H28hFRgfMxE6n6xvKEknwZOvdBzOexKEGHxbARteQ=;
        b=g/gWzQ9o9kWKihNUERRUT0pHLsj6gq12yE3aSgAEBjElQsyhKoRFXcXrm0u6ay+J/I
         WVQb5I9nFKo3sDbvtzY3yrEYLjI+5SjP7q94uhietG1+5BR1vL470joV3Fsvl4ltzgNf
         4ydErgentwmUsO9KDktFocvYD1FLEDLAwQjHZi/KOM2Tr/W4lPTTPpzghmmgB+G2IazH
         gHOZE4DuvKTgBDmK1ZfXJ9Vl6DgqmWNPAbl+yLROZ05AbbBeA2klvrzyhJR3sIKiU4YD
         PavFxBYPVbYqowYI/+xQn+DMiOdxYqWy7thehmFaHRDNlh7J93b1yRFNsIvsIZoj0HZF
         QF1g==
X-Forwarded-Encrypted: i=1; AJvYcCUft4+DuozVcJLu1Ub3uEqNoBuRw59P2fNHj+LmU9U7/NkpMlaHB/eI+l1Yw+6elSgr5C/BEZKkKUk=@vger.kernel.org, AJvYcCXhdmzGF9/ucIOpRywBSYwvq2CJ/MDyovKXA6340Ey6toinlD3EOs4NUP4xVGzbo8SG4SvNg89wq8z8cqcV@vger.kernel.org
X-Gm-Message-State: AOJu0YwoHvwjxNvUMWZDCIqbylTAod1jFcX2FqiJ0+P1KWXmARQXnDom
	3sFpRc/78jPs9MXsKEfCNFT4mv3sWBnuDD00C/Wuap4EE3tWZK6Q2kWjuMKi
X-Google-Smtp-Source: AGHT+IGmatMTJnxCvEg3igsnFWsQvmr94iHKUL+dS5GXCEpfMtQ9lYjxJVCOrVzjj69MOKf30LWjbw==
X-Received: by 2002:a05:6a20:43a5:b0:1d9:1783:6a2d with SMTP id adf61e73a8af0-1d978af7c47mr1807757637.13.1729661646206;
        Tue, 22 Oct 2024 22:34:06 -0700 (PDT)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:1c93:3e9d:2c84:d5f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76e0877a6sm428695a91.54.2024.10.22.22.34.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Oct 2024 22:34:05 -0700 (PDT)
From: anish kumar <yesanishhere@gmail.com>
To: ohad@wizery.com,
	bjorn.andersson@linaro.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH V4 2/7] Documentation: remoteproc: move from staging
Date: Tue, 22 Oct 2024 22:33:52 -0700
Message-Id: <20241023053357.5261-3-yesanishhere@gmail.com>
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

In preparation for upcoming enhancements, this
commit relocates the existing documentation
from the staging area to the mainline Documentation
directory. Future patches will add further
documentation to improve clarity and usability.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 Documentation/driver-api/remoteproc/index.rst               | 6 ++++++
 .../{staging => driver-api/remoteproc}/remoteproc.rst       | 0
 Documentation/staging/index.rst                             | 1 -
 3 files changed, 6 insertions(+), 1 deletion(-)
 rename Documentation/{staging => driver-api/remoteproc}/remoteproc.rst (100%)

diff --git a/Documentation/driver-api/remoteproc/index.rst b/Documentation/driver-api/remoteproc/index.rst
index 8b8c8f512e2b..6ac5a082bf4f 100644
--- a/Documentation/driver-api/remoteproc/index.rst
+++ b/Documentation/driver-api/remoteproc/index.rst
@@ -14,6 +14,12 @@ Authors:
    the hardware differences, so the entire driver doesn't need to be
    duplicated.
 
+
+.. toctree::
+   :maxdepth: 1
+
+   remoteproc
+
 Mailing List
 ------------
 To post a message, send an email to
diff --git a/Documentation/staging/remoteproc.rst b/Documentation/driver-api/remoteproc/remoteproc.rst
similarity index 100%
rename from Documentation/staging/remoteproc.rst
rename to Documentation/driver-api/remoteproc/remoteproc.rst
diff --git a/Documentation/staging/index.rst b/Documentation/staging/index.rst
index abd0d18254d2..8884af4556b4 100644
--- a/Documentation/staging/index.rst
+++ b/Documentation/staging/index.rst
@@ -8,7 +8,6 @@ Unsorted Documentation
 
    crc32
    lzo
-   remoteproc
    rpmsg
    speculation
    static-keys
-- 
2.39.3 (Apple Git-146)

