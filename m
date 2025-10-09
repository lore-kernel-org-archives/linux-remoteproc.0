Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72234283FD0
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Oct 2025 21:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760044854; cv=none; b=oICcNKVfa/vJotp4CcPzRbIj6y+izI1aDARNyGbzL4YOmxiiBLRqXAv/V5MJef2K2hqbo3MWjPnwCjfzb9ufHbCWfU1nXnOvGRUG5B4XTV/uYMHo2JWZbh7ZTtt4g4WkgReQPIGBoLXf6tA4xBXZEDWrHbIkpYqri7s14p15lsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760044854; c=relaxed/simple;
	bh=5Z7F2UPREvGp5FEtsnFrVwld1p6TT/Qq5YikRzeYqHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tVaoh9OzKfrFU070xfQXgCFJHuQawlOB978cS4QJOSaXETfbcxkDXFMx37F8z5mV9u4x/FxClo8P9Qp/Xvuw3DNHnk4ROSVzanCftCnzDZnALFNJhdDHalnbWujFrEPjCWatu1NAlQN2pKL25w9mFnOX9+LsHO1InHLpnJT8w8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PcppOuP2; arc=none smtp.client-ip=209.85.128.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PcppOuP2"
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-77636fb28f6so12312017b3.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Oct 2025 14:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760044848; x=1760649648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8pC7vKNtvxXJSB4veOOQwTeA6v2wJSbqIf9D6+uJhGQ=;
        b=ngfCNua5VWmyGKsS4LoKi6iRWdk6eIZZHMRVAx/qbd9yTLBwY4RWCHDHgWuaEbMp9Y
         ZtrQJQ7AKeF+j+WituO91+yIMoSqT2tGW3ulVtTwm9WMWJFdOVV5baQxmkJcY3v5mLMB
         45psLYMsnWFJO1huINlKNgdkfrNozALr7rsTIa2hdmCsuXs+uti6GvTtoOv4zhJMEBgg
         HjSVPnXZKO3vw5SaBc6DZGaohg/+/TplXDiOsKjp063unxEdyu5XiHBlEHKxosfl19cv
         9WFRbBuo0wDitPH6Fr8a0QBWcaHTjzz53EQCD5STmeVIChbCxqg3UqFQXMIFqVp5+kt9
         AGbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtJ+xGzuG5H4ej4kqq0nN4ulWxX2uzRjqKS+TtDJPL8JoRZG2d2Rp84CpgqZHzUFLo4arCYmRIPAqSETwIMhpc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgs7qQZODvqZVf0EiOnUawlBHpx2O72jfZUGJiUB6zxrjGiv+B
	po/6WaXBNuO6TZfP91O1NqD9BC6EgFoKf4Q3e/k4I7018aYTs0clv30voZFjxP5NYD/zGYDUFTJ
	TMhEkGqKUtk+ZCrbqhkBBGH18Q5L/dYtmLEh49M5NgMBGSijHmvrowxQOk1vVChYpFL0jEesL8i
	n2ybYhjZJb/tThbXubWpKr0x9srP3JYSBgA8hPNFpM562r4G+7K5HkNisY2mycb0WvulWMHNWi/
	1kGCBMBx7XfSfd3HTf3rw==
X-Gm-Gg: ASbGncs6MUY7GpKqo8+9yZBJK9SqCyFouzFlL+WJBVqwPTqXgA9ajXuw3PgUl4hZDxW
	9qY8icbMfARNSPRpvTUgk39vgO1UVMMeb7PjcZAKJi+mukndjwI9ZQHUHoNhHgzRWbG7m0fQGYE
	PhsZ4UGZQCaQmwjQulwWh2wm5jOov7M2oX/sTLimGPrCnLA/BE5eqr0TkxLR1ry1qFPucsYcDIV
	l82zOCIkKpE2Et1yYTjwybJpx6ntH2zWGtNeT8RQq5rYGDtbwjfpTovWf6s3IW7amGV5/cxA6ih
	NlkTZp/Hj3sZoBs5+H/6Rqd+JZXm2XfnmgcNfYywy8HTnXGgDKbJ6gDJ6NEAItUseguKug0u5ir
	H86aTY25Rv15Ceo7zifpoeTeLICMK6ZqOBPeqLvc3pIA4e0yhYoHQb+KjCo3AnxW/vknjAbHlPX
	fTRQ==
X-Google-Smtp-Source: AGHT+IFr3esx8K/QkfrkA/zV4SUFtn8DV/VXcTfhP8k3nt1e4KArt7IMpy7WwBBZpdUcGtP/lXqXQUBf1rqP
X-Received: by 2002:a05:690c:fc8:b0:781:64f:2b19 with SMTP id 00721157ae682-781064f351fmr17784027b3.59.1760044848382;
        Thu, 09 Oct 2025 14:20:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-72.dlp.protect.broadcom.com. [144.49.247.72])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-78106d5829esm392407b3.13.2025.10.09.14.20.48
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Oct 2025 14:20:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8635d475556so270255485a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Oct 2025 14:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760044847; x=1760649647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pC7vKNtvxXJSB4veOOQwTeA6v2wJSbqIf9D6+uJhGQ=;
        b=PcppOuP2fE5nCC5mBvxBEuDFegxsNXPzfwQeg+jatq2Ojhu359hFo0AdJgh/Q4Oadu
         AnQ4bbhzDWK9YNdoQcj+pEP+w8JZvRzButrRzBZ/X3EuTPOnZheWmF6W7AT9RAeYgqdc
         w1mh1A/AbeNNg0vq6WepG4MQNC3+hXbwXhG4Y=
X-Forwarded-Encrypted: i=1; AJvYcCU1oCSjvcKJ5WAGdOh5Sld21dal9jMG/99UVwNkbX+dp9cCE97Gs2sF8JBSCjMMgcyP+drwoou4Nac+W3lFFVa0@vger.kernel.org
X-Received: by 2002:a05:620a:711a:b0:7e9:f81f:cead with SMTP id af79cd13be357-88356de6853mr1368994585a.71.1760044847464;
        Thu, 09 Oct 2025 14:20:47 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:7e9:f81f:cead with SMTP id af79cd13be357-88356de6853mr1368989785a.71.1760044846973;
        Thu, 09 Oct 2025 14:20:46 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f9ae428sm274832685a.16.2025.10.09.14.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 14:20:46 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: peng.fan@oss.nxp.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v3 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Thu,  9 Oct 2025 17:20:03 -0400
Message-Id: <20251009212003.2714447-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009212003.2714447-1-kamal.dasu@broadcom.com>
References: <20251009212003.2714447-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Adding myself to the maintainers list for the hwspinlock
driver on broadcom settop platforms.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 97d958c945e4..21b78f468169 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4972,6 +4972,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
 F:	drivers/gpio/gpio-brcmstb.c
 
+BROADCOM BRCMSTB HWSPINLOCK DRIVER
+M:	Kamal Dasu <kamal.dasu@broadcom.com>
+R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
+L:	linux-remoteproc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
+F:	drivers/hwspinlock/brcmstb_hwspinlock.c
+
 BROADCOM BRCMSTB I2C DRIVER
 M:	Kamal Dasu <kamal.dasu@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
-- 
2.34.1

