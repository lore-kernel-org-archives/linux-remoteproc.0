Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC23819309C
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Dec 2025 00:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327059; cv=none; b=D7NGSnTPWDBRr1sS2TXSClQ7SDYTvZcqie/04zksneFZk9maHNV8ppZXJaX5uXVIoNdjCqA2eqx2rl1SF9s1aCJPP9YrI+PpFSzvAJPo577ecwO4T5dlaxhjLPIyVynNsioGTspXr0PCj0RsDQvIB5lNaqjO1Ho719+SPFBl3zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327059; c=relaxed/simple;
	bh=K7SL4I/jLPDVOaIVbr+yXThL0SdIYhmyS5+E2q11BCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zhf2rdcejLEkXkf6FIp9kMabFgA4S9ZMurHC4EeIQIh1T2HDr7rdq+iQpkOzIiYu1e7bm5DHm1w1cviUgmD0RvIkZirSQ5t5SEIyoCI5pIZxzs4qwqvYiu8xowWnIU4NCk42kQ2pEjejaJI3l8cXpDJzZw6eLZ56ldOFBIUi98U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jg+NfP2Q; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jg+NfP2Q"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6574d7e451dso3830226eaf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 16:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765327057; x=1765931857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVce6XDDwdhvebzxe/BKrWVM8PIwQ4nAIr2E3eOzxcI=;
        b=jg+NfP2QoCYdEl966aaeRC5omG8icNcB/QVKRa2aPZsXeonfqsATS+u/kRwEv+5KSL
         vDdaFPg7aU6QxStC4uy2B+EyOtt36+nRbsV9YR3NugAh/l6ClhLmxGkGH6X1X0gl4mtJ
         xJuEPjUSCxh68gY72tM3RTvo43YENpW9yE8zXlm7+8BeYGn+i5AEXjdz0kYzdtIkoqYT
         FyjJqjwOuygLiCjr518dtT/XzyBGmFNlo/XAk3d9J9cVlFwoMcrQ7WPZavkmQjadIScK
         e46N1CmeepapMJ3bzlgyXUHVXwngjUBy6d/VV9G1U/v3XW/nPeOhIZcq4jZkFmO1POyi
         awqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327057; x=1765931857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVce6XDDwdhvebzxe/BKrWVM8PIwQ4nAIr2E3eOzxcI=;
        b=X9YWsni3UQA5k5b+PNzZZzDpC9e40OmSoOgD3KcqGZorsRO7fgWz6AtzB0TJFBj82d
         LLe5PdhLvgS6FzHZ37ecxOWfp5OcLACQ1QJTxjzTeRuqR1uY9PCDynWl5g/aBsSCNKgM
         u0t+NZfounMhIaNYd7AsjjPlkQXprhJyEXJ7NFxP15GkZcpiIwVjwEqBb/nsWJEOL6Wg
         E311+cE080LMDmFTjqLtXRKconeXJoVERGH91XvH/w3flwzHCl5ccucOU7SRCkvRC3Gk
         mR/SMwCVQtFoMQlnQeYFOFMk3fxTWz2GxkI92L2SlkGCeZGOif7UCsQ9m7U/nVVbuVK2
         Urcg==
X-Forwarded-Encrypted: i=1; AJvYcCW7KU3cNUezSSCFlLHjCU3zO919WoZp0QtN1yz4D5PvdZ6qlO09ETm4XucUl1RBO0LtUibiRjIpaCO+kQ8sxpU1@vger.kernel.org
X-Gm-Message-State: AOJu0YyEr0Km2oP9zLZfZbnCm2roKfgtOn6eBwNMTUWayzpZcmd35Dyq
	fsdfTc9q54UvCttfjyZykkgDIioGhY1X3cgNsT0V7/2hMABQ3Uhib2a0OAIIilCz
X-Gm-Gg: ASbGnctsNWSxK1LBPM+LK92zR15qCaCFvuFBWgoinNiJ9EGf2K4w1g+iOu063byxo8D
	l0eay6j/sTc0ZnD/xOxR8bVlr4p6WWycaHLA8JC6llHmr4eHXKRJ41j6Ldg9DMlxhwdswGeDPNm
	JcsZQS9EyQ0HuvkMPtu0nTQDq2My9HuJr0Q6HlpcscfHVv2TrvtF9CQcAovpyd+ZSinAITdC6te
	3u2pZffmn6aX2KnDYiCXBbQm3kNct2Pa4LaQjBZphsla3nsE0IvdA/2OqaShwofU+6QcvdMslD9
	b1RN1D7k9jMuZfC9+q3FShePupxW2/+kjOgnPAag396Ra51Go8o7oe5h9ktTsssKuBZ4zOC/syK
	k2R0YYRaXBxgqB/PzAfS0t3n8Of2Cv2S6saIdMSprLdX/2qMroaviHUDNBE1K40QVAm8RnF3lcn
	gdUc66A3Dkqb0TulcnISBvf67vlcF4ZOA9D9qXbjqS72IiEtLF+euLkACBFBU5DBxyxE7n9Am9a
	05R7thbBX0F4iWaUW3hRosM32DzvsgyHVb5ciA=
X-Google-Smtp-Source: AGHT+IEg65s3h9e8Yp05cjRdQ7oOeApFKAZof7ptzLGUYqrrlMeRO3TUWBgDrWjfg7jGq7tFMiGYeg==
X-Received: by 2002:a05:6820:1845:b0:65b:2795:cb0b with SMTP id 006d021491bc7-65b2abacf7emr471229eaf.1.1765327056774;
        Tue, 09 Dec 2025 16:37:36 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ea6807esm8588826eaf.0.2025.12.09.16.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 16:37:36 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH RFC 0/3] remoteproc/qcom,q6v5: introduce IPQ9574
Date: Tue,  9 Dec 2025 18:37:22 -0600
Message-ID: <20251210003729.3909663-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I want to enable ath11k on IPQ9574 SoCs, which uses the qcom remoteproc
for communication with firmware. It is similar to qcom,ipq8074-wcss-pil,
and I think it makes sense to extend the IP8074 path. The existing bidings
are not yaml. Am I required to convert the bindings to DT schema before
updating them?

Whom do I add as the maintainer for the YAML binding? Do I add my name? Do
I need to find an existing maintainer who is willing to use their name?

I would like to add the remoteproc node to IPQ8074. One of the resets is
missing from "qcom,gcc-ipq8074.h". Can I use a placeholder value with a
comment? Am I expected to enable the reset in code before adding the
devicetree node?

Alex
--- 
Alexandru Gagniuc (3):
  dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT schema
  dt-bindings: remoteproc: qcom: add IPQ9574 image loader
  arm64: dts: qcom: ipq8074: add remoteproc nodes

 .../remoteproc/qcom,ipq9574-wcss-pil.yaml     | 269 ++++++++++++++++++
 .../bindings/remoteproc/qcom,q6v5.txt         | 102 -------
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         |  79 +++++
 3 files changed, 348 insertions(+), 102 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt

-- 
2.45.1

