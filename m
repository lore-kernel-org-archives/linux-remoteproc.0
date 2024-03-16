Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57FA1BF27
	for <linux-remoteproc@vger.kernel.org>; Sat, 16 Mar 2024 18:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710613008; cv=none; b=EJ1IpRP4vpPVK9MF5jqIGg4/ztRz11AvhJ4d9x9fUT+S4QlsNNoIM1zc2IbXfI3/IISNGvDFH0xm8Q0TfLsyTvtwvuTFj+R13CyZ7vWUxv3SjHbUkN0u0bF85lkK5pckL4BsXNE6XnIEpbagK4ON/Ir5V4E32NhhsrI0fbEBk6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710613008; c=relaxed/simple;
	bh=BDDLiIHm5MySZauFPJVvznN15QfQtfeqqXg5UEfUEp8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=e1ih/9QvB8DoCCwXxd6TJ3gxQb8I8BmCGfBoC5beOYoeWUNv74h1NQdzuTpxqNokD/pnYX5MQlLXohk6Aj36A7B/N2sE+2PoimySKnq1cxyC8JVMrIIgJXtJCkCInBLY1tHJLF8wc5rHPDVrS3omWKA2nGkXqYNVcoxmHOxfl80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYNiFkfJ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYNiFkfJ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a466f89560eso397286066b.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 16 Mar 2024 11:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710613005; x=1711217805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BQo86H+KKL2iQUpe5TXdIwdHBfwFbjXE7p1G/QNwns=;
        b=HYNiFkfJ9ws2IjVvOGtW/rgaLkWCtBWmeT7FwNULWrk7HJJoK/pXEqsStaP3cS+mMX
         qKvOXXsdO560bhTblHNr9VyKvXha1NRy19b1z39FpNWd/EW/TzZrVEIzNibDBea/keZ+
         EOqrdur29+joKNkLK/vr3Wn/YwnG+geeoddUcYmFByF9Wf2MamB4fzY/3nuZNLoIncAo
         JHpqzt8fNkZWJC0TNcxJBcRuTEskyOtEVQHGOF1Q01T3aqRxO5eQ0lfBNSZZKzkA+88y
         6L+XfEIQ+jDlrXjKrk7rGbTXvP0A6/rLmlokOuY3FfIrhR1NFIyYPDkyrKpafQ7DPRER
         62bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710613005; x=1711217805;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3BQo86H+KKL2iQUpe5TXdIwdHBfwFbjXE7p1G/QNwns=;
        b=v4TJQN/Bh0cDwEP0w6rUq7lyPKCk/qYcl0yjvy9VRstgRtP+r4/vgQPeFPuqQ5sZ5C
         sHYH23wsupZyK42DB1pYjXgrsFiPhxNV+kFmDrv6O1xLhEw4fHW/J9RCE6ImyXIT9IKp
         IMli7MQllzXi64g1IX+2gdfHtQGqtB8+meA7kE1gao8BtgLKHRxjgc8GZNa4R16y3QFW
         7/bq2W64ikzF74ZB6qJiGTEoGH/Z7WzmgDVIusf9Ba+JvZb4blixlLRp3Wfg6MfW26ul
         XQyo5OmZ7+b5TQo21iZX7EI7BHKbYg/MsgpCCj7wdBSQHmkHTz3BsP/U78HngAKIsJPg
         TG+A==
X-Forwarded-Encrypted: i=1; AJvYcCUEh7UURAQDAo3ujWuAMKgCDGYSKaR4kCOJlwYA8gY8HRz4vI/ZwJxkyVlpfx9KLVGYYElzNL1bERc7NwYjpVhYOA+jTRlgnLgz3o9ee/0mlg==
X-Gm-Message-State: AOJu0Yxj63s7nfBvQqOyizgBN6oKR0kIbQTvAUGoKXcGmeM/pJsJNtFq
	b/asz1Q36gOV1WOFzUTHf9U72APxhyyG8eMsK040uhflDj5mHhkc
X-Google-Smtp-Source: AGHT+IEz0dVihumTjQvKXWaGYzSYaEM+ZgX/kWUB5N7UIRpD91MBvWDGamkrTuYAMHnwc07WagkUXA==
X-Received: by 2002:a17:906:874d:b0:a46:11a9:430 with SMTP id hj13-20020a170906874d00b00a4611a90430mr5181284ejb.76.1710613004848;
        Sat, 16 Mar 2024 11:16:44 -0700 (PDT)
Received: from ?IPV6:2a04:241e:501:580:d03e:506b:69fb:b04c? ([2a04:241e:501:580:d03e:506b:69fb:b04c])
        by smtp.gmail.com with ESMTPSA id jx25-20020a170907761900b00a4503a78dd5sm3025404ejc.17.2024.03.16.11.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Mar 2024 11:16:44 -0700 (PDT)
Message-ID: <d4556268-8274-4089-949f-3b97d67793c7@gmail.com>
Date: Sat, 16 Mar 2024 20:16:42 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Leonard Crestez <cdleonard@gmail.com>
Subject: [PATCH] remoteproc: zynqmp: Add coredump support
To: Tanmay Shah <tanmay.shah@amd.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Sarangdhar Joshi <spjoshi@codeaurora.org>,
 Siddharth Gupta <sidgup@codeaurora.org>,
 Rishabh Bhatnagar <rishabhb@codeaurora.org>,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Supporting remoteproc coredump requires the platform-specific driver to
register coredump segments to be dumped. Do this by calling
rproc_coredump_add_segment for every carveout.

Also call rproc_coredump_set_elf_info when then rproc is created. If the
ELFCLASS parameter is not provided then coredump fails with an error.
Other drivers seem to pass EM_NONE for the machine argument but for me
this shows a warning in gdb. Pass EM_ARM because this is an ARM R5.

Signed-off-by: Leonard Crestez <cdleonard@gmail.com>
---

Tests were done by triggering an deliberate crash using remoteproc
debugfs: echo 2 > /sys/kernel/debug/remoteproc/remoteproc0/crash

This was tested using RPU apps which use RAM for everything so TCM dump
was not verified. The freertos-gdb script package showed credible data:

https://github.com/espressif/freertos-gdb

The R5 cache is not flushed so RAM might be out of date which is
actually very bad because information most relevant to determining the
cause of a crash is lost. Possible workaround would be to flush caches
in some sort of R5 crash handler? I don't think Linux can do anything
about this limitation.

The generated coredump doesn't contain registers, this seems to be a
limitation shared with other rproc coredumps. It's not clear how the apu
could access rpu registers on zynqmp, my only idea would be to use the
coresight dap but that sounds difficult.

---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 4395edea9a64..cfbd97b89c26 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -484,10 +484,11 @@ static int add_mem_regions_carveout(struct rproc *rproc)
 			of_node_put(it.node);
 			return -ENOMEM;
 		}
 
 		rproc_add_carveout(rproc, rproc_mem);
+		rproc_coredump_add_segment(rproc, rmem->base, rmem->size);
 
 		dev_dbg(&rproc->dev, "reserved mem carveout %s addr=%llx, size=0x%llx",
 			it.node->name, rmem->base, rmem->size);
 		i++;
 	}
@@ -595,10 +596,11 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
 			zynqmp_pm_release_node(pm_domain_id);
 			goto release_tcm_split;
 		}
 
 		rproc_add_carveout(rproc, rproc_mem);
+		rproc_coredump_add_segment(rproc, da, bank_size);
 	}
 
 	return 0;
 
 release_tcm_split:
@@ -674,10 +676,11 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
 			goto release_tcm_lockstep;
 		}
 
 		/* If registration is success, add carveouts */
 		rproc_add_carveout(rproc, rproc_mem);
+		rproc_coredump_add_segment(rproc, da, bank_size);
 
 		dev_dbg(dev, "TCM carveout lockstep mode %s addr=0x%llx, da=0x%x, size=0x%lx",
 			bank_name, bank_addr, da, bank_size);
 	}
 
@@ -851,10 +854,12 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 	if (!r5_rproc) {
 		dev_err(cdev, "failed to allocate memory for rproc instance\n");
 		return ERR_PTR(-ENOMEM);
 	}
 
+	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
+
 	r5_rproc->auto_boot = false;
 	r5_core = r5_rproc->priv;
 	r5_core->dev = cdev;
 	r5_core->np = dev_of_node(cdev);
 	if (!r5_core->np) {
-- 
2.34.1
