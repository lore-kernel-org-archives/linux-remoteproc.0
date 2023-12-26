Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F3DA32
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 Dec 2023 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BSvIRUU+"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ccc7d7e399so5471991fa.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Dec 2023 16:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703550888; x=1704155688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSqq/oRAK8tG/6OBNWJ7j1pib3lTQhlU58NT4JC7FjY=;
        b=BSvIRUU+TWxuPDAzpRZsiNAa4NSLxShC1XboJVtxI2+JxNvRMk+F1i3N20FZ7xh9VM
         R2LInkWUANMkFNdZT3aQQ1TQnraXSwUtoqZAtdukVF2NrkkOlCx8Y3+cew0AVAS6uVtD
         tZhlth/ErUfkVEZwh8Zqvnhj33NAeuOGZB482MNBenHlrfsLudTqRtz7y7Z745v4Hh2/
         /Dt4zUhAcn0JukAxqlrX+nVBMLAJA7BwbGFdHuSFCdZadvHGBjr5wwB8og8AgX52qu9w
         4g/VrGp1gfLsATcvTQQBoUpRnXOOPGkuDzWzr5+kOUYuygGbcj1qpU5LNZfnnX8XxT8W
         kckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703550888; x=1704155688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSqq/oRAK8tG/6OBNWJ7j1pib3lTQhlU58NT4JC7FjY=;
        b=m5ywtin+oow9FPKnRxvW157Sk077ZejLlGO/om1RnRqlHMDgYVvyZgA31e3qkD+D3R
         5wQDJ48y70SdxG0ZplTpTXnW3Xo2hpm0SMBMlv/IpRazT6VsPpz0uibvWdpyK1e8Rnz0
         i7xd9PjcgGA83Fa/pt/Aq/M25zOUy1dSVeQT+1CsaHTLQP4R7W3qBN17aHn2OxwHeOwS
         5368fNodhKHZAN5wWh5BYh48a3HseVG0fAhPfkxBiVtMzyuaj8xnJjgwzj8Jke4m4ufr
         zsKKLIPVXVHR1H0Nba+S+Qc0FH+afunu4zxVEmdu3FhqjkXJUGmYxBlPNGuoFkXVwEyH
         ijpw==
X-Gm-Message-State: AOJu0YyolkBJ0u2OsljB7ktcCxSsAVnxy0eactLFLiSE8kmkuiPV6wf5
	Ub3EH2pL7rSX/hf2evd/G+e3Xu06JosA9Q==
X-Google-Smtp-Source: AGHT+IGR9Z2RMSQd+nXkE/c0vlRSUUG71sv+Oa2PTNfwTNLaPDde+99dFVskzIZpJV/OxZqu2gHH8A==
X-Received: by 2002:a2e:9895:0:b0:2cc:94dd:483e with SMTP id b21-20020a2e9895000000b002cc94dd483emr2243027ljj.2.1703550888302;
        Mon, 25 Dec 2023 16:34:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020a05651c088100b002ccb1301d53sm1368810ljq.48.2023.12.25.16.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 16:34:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH 0/5] soc: qcom: add in-kernel pd-mapper implementation
Date: Tue, 26 Dec 2023 02:34:42 +0200
Message-Id: <20231226003447.3044365-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protection domain mapper is a QMI service providing mapping between
'protection domains' and services supported / allowed in these domains.
For example such mapping is required for loading of the WiFi firmware or
for properly starting up the UCSI / altmode / battery manager support.

The existing userspace implementation has several issue. It doesn't play
well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
firmware location is changed (or if the firmware was not available at
the time pd-mapper was started but the corresponding directory is
mounted later), etc.

However this configuration is largely static and common between
different platforms. Provide in-kernel service implementing static
per-platform data.

NOTE: this is an RFC / RFC, the domain mapping data might be inaccurate
(especially for SM6xxx and SC7xxx platforms), which is reflected by
several TODO and FIXME comments in the code.

Dmitry Baryshkov (5):
  soc: qcom: add pd-mapper implementation
  remoteproc: qcom: pas: correct data indentation
  remoteproc: qcom: adsp: add configuration for in-kernel pdm
  remoteproc: qcom: mss: add configuration for in-kernel pdm
  remoteproc: qcom: pas: add configuration for in-kernel pdm

 drivers/remoteproc/Kconfig          |   3 +
 drivers/remoteproc/qcom_q6v5_adsp.c |  67 +++++
 drivers/remoteproc/qcom_q6v5_mss.c  |  84 ++++++
 drivers/remoteproc/qcom_q6v5_pas.c  | 418 +++++++++++++++++++++++-----
 drivers/soc/qcom/Kconfig            |  10 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/qcom_pdm.c         | 302 ++++++++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.c     | 189 +++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.h     |  66 +++++
 include/linux/soc/qcom/pd_mapper.h  |  35 +++
 10 files changed, 1108 insertions(+), 68 deletions(-)
 create mode 100644 drivers/soc/qcom/qcom_pdm.c
 create mode 100644 drivers/soc/qcom/qcom_pdm_msg.c
 create mode 100644 drivers/soc/qcom/qcom_pdm_msg.h
 create mode 100644 include/linux/soc/qcom/pd_mapper.h

-- 
2.39.2

