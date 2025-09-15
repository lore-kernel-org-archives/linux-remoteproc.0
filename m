Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9104207A
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Sep 2025 11:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757934938; cv=none; b=qQXw38i2UvPe92BZG8BKAvk9nNxc0eN1y5+GW0KcaU/9zs2GLK0hLvXImqnFRbo2odZ9Mqy5vi46IQMMHDCJzJ1DSHPMvalHUh/LyqqDyIf86Z+4YebbCKontiy3RGY+VfGWUXh83cx2IBQu/fH5PW/PIbYBofFSj0sCjt5nFqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757934938; c=relaxed/simple;
	bh=hyJFbE9CxuOjX45Et2d7t+4UbbjB8uE8hXZbBtpCcl4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F9BzOTtVa5FefjOidhouN43Zth4diiF34WQ/K5GxVM+ksRF4KV1QOhmdc1d80MoWe5moGIc1jX1Ka0wCbABdEb3OhJO8Cbfvbgmr3c8AszOQMQgfxCAdfV9DILLuNxJjTeAqpncTVE6ymlypMU7hTlFAyYWw9KD9tjuMFIIQPFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nsHYZiSD; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nsHYZiSD"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-afcb7a16441so603895266b.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Sep 2025 04:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757934935; x=1758539735; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WSDSpRxe7vhx8m0cBW/hKeYQFhJF6BvlymOlPqDP5xE=;
        b=nsHYZiSDMinw/quwYpCkR609GCnDiT+7h8Cjr5TkgBArIbWL1fm/fJSQZLJEqgYHeU
         K/APOt2QHHp+NhCqafbO5GS+fGbISEJ4s90cZE7YAeFDVJSkHSAIgnH9Nv7k5VrjttXf
         /sKXCKCUucmZx3AuJsTJitCcwLh77vzkLsHbe2YY068ftFsqDtB8sZ8LxgfSAmp+Kwgc
         xwq/ZV+/V8nwwAyKpgk6GHBGRHDiqX3GN/kFeof+ZHCx4RNPyFTbAlXg9xscioGrwQCN
         HRy/Fh5i5LNKs8l6YI5ktsSRDnZHVlZ/+2Dz7gWL9sM+foKQT+OmjEoBBlHib1ICI+WK
         E/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757934935; x=1758539735;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSDSpRxe7vhx8m0cBW/hKeYQFhJF6BvlymOlPqDP5xE=;
        b=jU1je7WsXHTNSwSV3CKbhNpsQjoXtT2+8GOkji5C8506l0Cfp62hAn7GLT9avq+O82
         LEBdWYoxIDavgdSmhP9o2mr8FEF5OFtiYR7FUBtFDj5vqFYuKwwSE7KlZMQN4MPbnHtK
         8YoRwZuXjvRWfGJrp1AvRlDKflPajxGvT5LbVapBEaSBlfwmpXvoG3BEBomi3SC7Jerd
         pnsr2j41SF4OPtSGWr0w8XwLI3W4Dm1CIefdKacyPNj1S1fmNS5V4r65VcyIucIB+x3O
         CUqoNUAhvnlEc/WB66CThWJPP9BvgFBoeK8Y45DSOWqz2t05h21PG9CCvAD7zYShJccv
         bsjA==
X-Forwarded-Encrypted: i=1; AJvYcCU6kbUmOKE2lbFtJ+kdEJIGd7oEBOLeBMbTqRWEDGWzVRLFA7w2LS1niGHqRRTNM+3ONKjyhoI1rzgm2OIGvy0b@vger.kernel.org
X-Gm-Message-State: AOJu0YxA1ENievyzXKAbhGtL96vAWovtvFVuCIG7zlQrLvZdZP+4hvPI
	+CknDlcUvItzj/Peu2zfoUCj+GoxaBUePBy2+tiK7x4W8YX1HzqoBF0j0qoCvweEwXE=
X-Gm-Gg: ASbGncuSnbhHPa60LfZqztljMx8EPj0V0XyFno6lXjA3UIg4krSc/UlmuFmLHgOOAM/
	4qsyn6CloZWjRaYj/he0Dog/0FkxVCguWq+5qYYfO1Rh8B+ev1hm7aVuENh4gorXt1ouDTmtq+Y
	sV5fS5+I3M844G3gn1R/vTLtFc5Ql1QvLRF4/ZK7LiTwEwNi+2cmhT7kz7M6SL97EbZdAmwsBg/
	s2kSeNyWAiWBt/Cw6ZQxiDiztOy+jh4FT+0OihWF96bfzBur7lm711YVyqHEDlKry6LXA1emoqg
	uisGK9/QuGWX89O7gNm+oeaIz0SjueU4GlU+DUDp50E8fvD1f0iYVIN4EARQtYzDRP5wR+iA5CP
	qYOYIm1eIwAAoUbbe0qQs3y1vfAI7zv220Q4ndntz48K4g9bk2TLheLatzaisu5ZU5+pSjYIIaj
	97hGwj
X-Google-Smtp-Source: AGHT+IGywulimHhQJlO4Rta/TnERJN68O5wo9pU23FIpHxPwMOlZqSlAaI08bgPpXbveZOPsK2ZKVg==
X-Received: by 2002:a17:906:d554:b0:b04:5895:fe8e with SMTP id a640c23a62f3a-b07c35fb500mr1263150466b.36.1757934934697;
        Mon, 15 Sep 2025 04:15:34 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07d9e18c24sm561851366b.61.2025.09.15.04.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:15:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v5 0/2] Add support for remoteprocs on Milos SoC
Date: Mon, 15 Sep 2025 13:15:17 +0200
Message-Id: <20250915-sm7635-remoteprocs-v5-0-96526cac59c6@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEX1x2gC/23RS27DIBAG4KtYrEsFmGdWvUfVBeChZmHjALVSR
 bl7SawqVcXyZzTfaIYrKpAjFHQarijDHktMawviZUB+tusn4Di1jBhhgkhGcFmUHAXOsKQKW06
 +YMrNZCUnmjuNWuOWIcTLA33/aHmOpab8/Zix0/vrLyd63E4xwWokk3SCKgrwFmzM25xWePVpQ
 XdyZ38Z1WVYY0iwguqgXZBTjxmfjCKmy4yN8YaPDoySVJMew5+MIf2leGMMMB7Aece4/M/cjsN
 lOH+1T6jH9ZCzBXCrL7GehhUuFR9DKGsdtx8HjPknvgEAAA==
X-Change-ID: 20250620-sm7635-remoteprocs-149da64084b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757934933; l=1536;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=hyJFbE9CxuOjX45Et2d7t+4UbbjB8uE8hXZbBtpCcl4=;
 b=c9kaWiVTeM6gjqdm4+aAditUZF6OlBbcBbQU6dznmaG93q+yetGzBY6GLz/EwKawOeAs452re
 KixgzXs73GxB0d6gfYIlWLzquRRv7+LJVBcBqc4HeWMmGYzlmGMt/0e
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the bindings and driver for the ADSP, CDSP, MPSS and WPSS on the
Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v5:
- dt-bindings: Drop firmware-name ref, and maxItems for
  memory-region & firmware-name
- Pick up tags
- Link to v4: https://lore.kernel.org/r/20250905-sm7635-remoteprocs-v4-0-9e24febcb246@fairphone.com

Changes in v4:
- Rebase on linux-next to fix conflicts
- Link to v3: https://lore.kernel.org/r/20250709-sm7635-remoteprocs-v3-0-c943be976180@fairphone.com

Changes in v3:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Replace additions to two different bindings by one new binding yaml
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com

Changes in v2:
- Update default firmware names from .mdt to .mbn
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com

---
Luca Weiss (2):
      dt-bindings: remoteproc: qcom,milos-pas: Document remoteprocs
      remoteproc: qcom: pas: Add Milos remoteproc support

 .../bindings/remoteproc/qcom,milos-pas.yaml        | 198 +++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 |  24 +++
 2 files changed, 222 insertions(+)
---
base-commit: 51095600e8c19d53729a7fbd273abc4435a25e9b
change-id: 20250620-sm7635-remoteprocs-149da64084b8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

