Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A32D321BF
	for <linux-remoteproc@vger.kernel.org>; Fri,  5 Jan 2024 16:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJlfLXum"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so2191175e87.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 Jan 2024 08:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704470469; x=1705075269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=38V7OcbMS6BvfR/Kfa+Il7csYOikckmVIMPsPO2mrzc=;
        b=fJlfLXumnbjgA414C++MQNqKxdkH44NbYoSiS9Z5CAyw+quyTvGAetTALDY9ma58At
         1fLn6ZTPqKpmW3NC8CqORI1Lm2kw86STv6u2xFQNLw/lRzLn3a6v1TB3DFGv3rcKN+cL
         4psuVWg4ouN3acZzD0E5Z77Dkx0AHZpmXa27ek4+P2zxCH2MnTH1QeGUbvCH0PnMeZb+
         DSgbGO+57vpTY6KdAkYHLVt9mvLJq6rnXPzH2LLGh3xlyeygmGCZeXOODFdkVV8iH8w9
         ptwjvbqfU5Qux2qbobg/KQoBZ9/ZsFJAAT7mdesYEfUIxEeL9CkQdyqYr7JPv5uoIt5G
         PLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704470469; x=1705075269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38V7OcbMS6BvfR/Kfa+Il7csYOikckmVIMPsPO2mrzc=;
        b=k+iNufFpNzQ9ZyvjZdIE1AcgAdvHSBBxfuNH63mJeEgdABSGBA8WaRe5qq7vMPUjh6
         KgS9JL15mXEDlJI45bO1VXJR2R2iP3/1QU/0ERMRlEACq1be0ek0NfbHwzaWETyFUJ/b
         YgAovfzkb/AcmXSX9fTfYOmv2L7hZODYPDBsuDrGG3F1ChYmbPF1N/l/bJk36wvJ863K
         bJ123dnAlTML0XmFN1Vzeol6Wa1xyw8NaftH3yzTXnVSF9WmliUpxOdVzSBJW/Jp1NzY
         IsXDKlh8/h4ywwjkBZjf6A6mJFCsb1BJnjiuzZ/NIvh08IQK8cfQW2rdks91BTbaa0zw
         SiJg==
X-Gm-Message-State: AOJu0YyBgUlJbxhpQAD4VGp89tP+hIkjfD/j8K+AjKMouVT2sxidoavv
	hQboZxVc9NB9ezOO5VxGwH6Qw1pDGBPMqg==
X-Google-Smtp-Source: AGHT+IFh9YVPZuE9tKS0AFwt3Ec/+vDaZEOHyXj2dDkN6g3GOJ4V2yIMVU7V8xUNC8GjeZWedVH3Zw==
X-Received: by 2002:a05:6512:2315:b0:50e:6ec3:6a42 with SMTP id o21-20020a056512231500b0050e6ec36a42mr1573154lfu.126.1704470469081;
        Fri, 05 Jan 2024 08:01:09 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id n5-20020a056512310500b0050e76978861sm262094lfb.277.2024.01.05.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 08:01:08 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Kevin Hilman <khilman@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Nikunj Kela <nkela@quicinc.com>,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Ben Horgan <Ben.Horgan@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/5] PM: domains: Add helpers for multi PM domains to avoid open-coding
Date: Fri,  5 Jan 2024 17:00:58 +0100
Message-Id: <20240105160103.183092-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates in v2:
	- Ccing Daniel Baluta and Iuliana Prodan the NXP remoteproc patches to
	requests help with testing.
	- Fixed NULL pointer bug in patch1, pointed out by Nikunj.
	- Added some tested/reviewed-by tags.


Attaching/detaching of a device to multiple PM domains has started to become a
common operation for many drivers, typically during ->probe() and ->remove().
In most cases, this has lead to lots of boilerplate code in the drivers.

This series adds a pair of helper functions to manage the attach/detach of a
device to its multiple PM domains. Moreover, a couple of drivers have been
converted to use the new helpers as a proof of concept.

Note 1)
The changes in the drivers have only been compile tested, while the helpers
have been tested along with a couple of local dummy drivers that I have hacked
up to model both genpd providers and genpd consumers.

Note 2)
I was struggling to make up mind if we should have a separate helper to attach
all available power-domains described in DT, rather than providing "NULL" to the
dev_pm_domain_attach_list(). I decided not to, but please let me know if you
prefer the other option.

Note 3)
For OPP integration, as a follow up I am striving to make the
dev_pm_opp_attach_genpd() redundant. Instead I think we should move towards
using dev_pm_opp_set_config()->_opp_set_required_devs(), which would allow us to
use the helpers that $subject series is adding.

Kind regards
Ulf Hansson


Ulf Hansson (5):
  PM: domains: Add helper functions to attach/detach multiple PM domains
  remoteproc: imx_dsp_rproc: Convert to
    dev_pm_domain_attach|detach_list()
  remoteproc: imx_rproc: Convert to dev_pm_domain_attach|detach_list()
  remoteproc: qcom_q6v5_adsp: Convert to
    dev_pm_domain_attach|detach_list()
  media: venus: Convert to dev_pm_domain_attach|detach_list() for vcodec

 drivers/base/power/common.c                   | 134 +++++++++++++++
 drivers/media/platform/qcom/venus/core.c      |  12 +-
 drivers/media/platform/qcom/venus/core.h      |   7 +-
 .../media/platform/qcom/venus/pm_helpers.c    |  48 ++----
 drivers/remoteproc/imx_dsp_rproc.c            |  82 +--------
 drivers/remoteproc/imx_rproc.c                |  73 +-------
 drivers/remoteproc/qcom_q6v5_adsp.c           | 160 ++++++++----------
 include/linux/pm_domain.h                     |  38 +++++
 8 files changed, 289 insertions(+), 265 deletions(-)

-- 
2.34.1
