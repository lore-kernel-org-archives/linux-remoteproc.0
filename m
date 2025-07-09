Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B782F28DEE4
	for <linux-remoteproc@vger.kernel.org>; Wed,  9 Jul 2025 11:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059602; cv=none; b=SHyk/Ejk+PBTkutJn6RY817MVTJpCaH+P1mZnN2979C1OQKvpTxALqZPjpH4jRaC3KMiz5ZfgWK/Wscs5mSsVQpoyM4XC0XDRraGPmDi2VjqNUaPc6fiCGvhNtUyETJNgmBG9+gjchTeVlhbsiJc7UEAuJ6yrFAt9a1cCEafM90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059602; c=relaxed/simple;
	bh=KmmXb3IGW58F4EYW7Gl3SaLFXPNaUzU3JQDJ5hBWE8I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X8/TfF2vJmEIamGxi0rys0sPt5/cBg9xcLiJShmoHli/US92YLprIyG3pGj92UiLA4gk6Zk/vcV58jLNFd01I035g55ilcs+RDSecQSrS9DFneH5cWqQKWBDHzsZYyh2WnZnezPArCoaWwdfMBddHMlaKqHbjaBvXgSSAZ1pbKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=p4vwdbNm; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="p4vwdbNm"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so9081151a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Jul 2025 04:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752059599; x=1752664399; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGK37SR9qg+mqCt4whATIIAp/+XzlTiBnwS50eY+IBo=;
        b=p4vwdbNmRBhhCsmK06v1IGoZd8oWiALu0lzzJj0FPOe6/XkinSkaTiyfOP7o0d6QSz
         izYggpYwtGT9l3Ox9fXOks35M/QP09liEiwb7xtfP0E+cZcoDXmQwpLhKn4CBG6gbTsX
         NUkfvAKwrmd4rw1yaSt+d9Dks7NbersurvO+rFtPRHgK0UlIQDZAHm+clZ+U+Rc3Av/v
         ZsjYa+hkoAQjpE6Nc6jjL8rv1HslxIP4LNJMxO8bsADjgAlkNGmj4RdyUyChIwdAec/J
         RBJ9loZgvsKk1GQPRA4nfEZMxKrRZKPnRLSc/DqtDfd3wHW1EPyEPp6lDjdzsT6b1IqA
         4SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752059599; x=1752664399;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGK37SR9qg+mqCt4whATIIAp/+XzlTiBnwS50eY+IBo=;
        b=K3+NvSkkVpE0Q3Qx8je/dP10bG6cC9CV8S80kcxXQqM0gqa9eD/MWsIzheMJf8VD40
         GkPpBOma+cUGewbywibpW763AxvXoWp2Pf0DNrzzS+lLQdLesIlHW9Heitv2AN8Ux/2T
         Eor2RwAnn+ekbZfsstze/oGzkY/H+slbkGnwGqgTv30+xeaMqkjVG9BDJLckpJjKgjNh
         r+NCNv6GAf/sRPeaBZd2mvrod4+dUH/2AYGdDwWzpYJ8LVw57as6pYPoVoA5RLi/DQgf
         N7xNJHoRcNBPlIyC5LSzPJZpw9JhsTqcuGah0xTCzQEMrdyzpYC7qK/bub/QBFqsysW9
         EiLg==
X-Forwarded-Encrypted: i=1; AJvYcCV3m8PcIuCWFe0u2JabVxwVFdlEJan8BpULos952AgThUSMkKAfo/+gaTKeA9CxMFEqGLfkKnJZ9lsaIM+qParA@vger.kernel.org
X-Gm-Message-State: AOJu0YxxKJl1/9Mw+COpLHL45BdjirmGmx4zpkeG2YsC3y7W6+8O/LY6
	Kb0tTm7F5+Mc42nIJBjuTmzqxcRlc2o8g/3W6/nYKonDgOZC8ZF/7Lxs5mPni6UBixQ=
X-Gm-Gg: ASbGnctmpcaM8gAaS2PpdcHfN4vwoVdUce8ajqwrMp8yipGiIOlItq00opUP07ZN76e
	RqU75h/yyj8qOMMi+Hx8wiAtmsYQMYZMIGkmCLwc2DPQltEUoipIvaFY3GUqdli+Iwz9+aqZVNu
	5u1VQlt9uX3+AbYfoiAVLw9fL0hN7D9OW47Aa+Zc1M0df9HwQmpeTpLbUvdQgwa8eOYZNjByYrM
	iWZx5ZVTj3kU1xklZVQjCdbgwZWLnMkf7PdJyWrv4t6gBzr2+MO8EAQCCxpvKinRy11cykn7lkv
	ziO6eMYxm1gYCLGN3KMORsDgL0jYo+LPxuIfVRg8bf38/+PuL3i2OY0HwG9cDGFUmN1Mg/meUl/
	8O3GljjhMOett8zEWcpqZdX0K2EvgUx5d
X-Google-Smtp-Source: AGHT+IHp9TcPLQmc20T7xVbbGWJIvpTGAkt0LP5/ytEl/Z6MxQQcC47ryedmByXsGf3LPA9gfi8oRQ==
X-Received: by 2002:a17:907:12d0:b0:ae0:d4f2:dffa with SMTP id a640c23a62f3a-ae6cf591593mr163224866b.3.1752059598963;
        Wed, 09 Jul 2025 04:13:18 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6daed7d49sm27191566b.114.2025.07.09.04.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:13:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/2] Add support for remoteprocs on Milos SoC
Date: Wed, 09 Jul 2025 13:13:06 +0200
Message-Id: <20250709-sm7635-remoteprocs-v3-0-c943be976180@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMJObmgC/23NTQqDMBCG4atI1k1JovlpV71H6SKaSc1CIxMJL
 eLdG4VCKS7fD+aZhSTAAIlcq4Ug5JBCHEvUp4p0vR2fQIMrTQQTkinBaBq0qiVFGOIME8YuUd5
 cnFUNM01rSDmcEHx47ej9UboPaY743n9kvq1fTh5xmVNGdc2caiXXHODmbcCpjyOcuziQjczil
 9GHjCgM81Zy403rlftn1nX9AABrd+H/AAAA
X-Change-ID: 20250620-sm7635-remoteprocs-149da64084b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752059598; l=1151;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=KmmXb3IGW58F4EYW7Gl3SaLFXPNaUzU3JQDJ5hBWE8I=;
 b=BFlJHfIFdwZNkCcQInWTPJFGa8OC9zQO/qCl4TGtDIRqZEYzwxhUdEUp68M0bVd5J0M9KrAmw
 wgEjAlwrq7/DlUOVrPHF0LNqzEMtwYR4oUrLlURJDy6FcrkD+HRcNC+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the bindings and driver for the ADSP, CDSP, MPSS and WPSS on the
Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
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

 .../bindings/remoteproc/qcom,milos-pas.yaml        | 201 +++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 |  24 +++
 2 files changed, 225 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-remoteprocs-149da64084b8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

