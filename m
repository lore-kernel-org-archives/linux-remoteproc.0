Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978B4C2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Jun 2021 14:30:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DE6C61984
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Jun 2021 14:30:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234300AbhF1OcZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Jun 2021 10:32:25 -0400
Received: from mga02.intel.com ([134.134.136.20]:49720 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234899AbhF1Oaj (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Jun 2021 10:30:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="195114820"
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; 
   d="gz'50?scan'50,208,50";a="195114820"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2021 07:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; 
   d="gz'50?scan'50,208,50";a="640927134"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jun 2021 07:23:50 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lxsAv-0008aS-Ht; Mon, 28 Jun 2021 14:23:49 +0000
Date:   Mon, 28 Jun 2021 22:23:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, ohad@wizery.com,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de
Cc:     kbuild-all@lists.01.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: elf_loader: fix loading segment when
 is_iomem true
Message-ID: <202106282206.GJ4hM7Fv-lkp@intel.com>
References: <20210628070657.7669-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <20210628070657.7669-1-peng.fan@oss.nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi "Peng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v5.13 next-20210628]
[cannot apply to xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Peng-Fan-OSS/remoteproc-elf_loader-fix-loading-segment-when-is_iomem-true/20210628-143358
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: parisc-randconfig-s032-20210628 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/2c90d7d15776bf485ad028de63002efbc2facc66
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Peng-Fan-OSS/remoteproc-elf_loader-fix-loading-segment-when-is_iomem-true/20210628-143358
        git checkout 2c90d7d15776bf485ad028de63002efbc2facc66
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=parisc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/remoteproc_elf_loader.c:219:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *[assigned] ptr @@
   drivers/remoteproc/remoteproc_elf_loader.c:219:45: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/remoteproc/remoteproc_elf_loader.c:219:45: sparse:     got void *[assigned] ptr
>> drivers/remoteproc/remoteproc_elf_loader.c:219:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *src @@     got void [noderef] __iomem * @@
   drivers/remoteproc/remoteproc_elf_loader.c:219:51: sparse:     expected void const *src
   drivers/remoteproc/remoteproc_elf_loader.c:219:51: sparse:     got void [noderef] __iomem *

vim +219 drivers/remoteproc/remoteproc_elf_loader.c

   131	
   132	/**
   133	 * rproc_elf_load_segments() - load firmware segments to memory
   134	 * @rproc: remote processor which will be booted using these fw segments
   135	 * @fw: the ELF firmware image
   136	 *
   137	 * This function loads the firmware segments to memory, where the remote
   138	 * processor expects them.
   139	 *
   140	 * Some remote processors will expect their code and data to be placed
   141	 * in specific device addresses, and can't have them dynamically assigned.
   142	 *
   143	 * We currently support only those kind of remote processors, and expect
   144	 * the program header's paddr member to contain those addresses. We then go
   145	 * through the physically contiguous "carveout" memory regions which we
   146	 * allocated (and mapped) earlier on behalf of the remote processor,
   147	 * and "translate" device address to kernel addresses, so we can copy the
   148	 * segments where they are expected.
   149	 *
   150	 * Currently we only support remote processors that required carveout
   151	 * allocations and got them mapped onto their iommus. Some processors
   152	 * might be different: they might not have iommus, and would prefer to
   153	 * directly allocate memory for every segment/resource. This is not yet
   154	 * supported, though.
   155	 */
   156	int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
   157	{
   158		struct device *dev = &rproc->dev;
   159		const void *ehdr, *phdr;
   160		int i, ret = 0;
   161		u16 phnum;
   162		const u8 *elf_data = fw->data;
   163		u8 class = fw_elf_get_class(fw);
   164		u32 elf_phdr_get_size = elf_size_of_phdr(class);
   165	
   166		ehdr = elf_data;
   167		phnum = elf_hdr_get_e_phnum(class, ehdr);
   168		phdr = elf_data + elf_hdr_get_e_phoff(class, ehdr);
   169	
   170		/* go through the available ELF segments */
   171		for (i = 0; i < phnum; i++, phdr += elf_phdr_get_size) {
   172			u64 da = elf_phdr_get_p_paddr(class, phdr);
   173			u64 memsz = elf_phdr_get_p_memsz(class, phdr);
   174			u64 filesz = elf_phdr_get_p_filesz(class, phdr);
   175			u64 offset = elf_phdr_get_p_offset(class, phdr);
   176			u32 type = elf_phdr_get_p_type(class, phdr);
   177			void *ptr;
   178			bool is_iomem;
   179	
   180			if (type != PT_LOAD)
   181				continue;
   182	
   183			dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
   184				type, da, memsz, filesz);
   185	
   186			if (filesz > memsz) {
   187				dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
   188					filesz, memsz);
   189				ret = -EINVAL;
   190				break;
   191			}
   192	
   193			if (offset + filesz > fw->size) {
   194				dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
   195					offset + filesz, fw->size);
   196				ret = -EINVAL;
   197				break;
   198			}
   199	
   200			if (!rproc_u64_fit_in_size_t(memsz)) {
   201				dev_err(dev, "size (%llx) does not fit in size_t type\n",
   202					memsz);
   203				ret = -EOVERFLOW;
   204				break;
   205			}
   206	
   207			/* grab the kernel address for this device address */
   208			ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
   209			if (!ptr) {
   210				dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
   211					memsz);
   212				ret = -EINVAL;
   213				break;
   214			}
   215	
   216			/* put the segment where the remote processor expects it */
   217			if (filesz) {
   218				if (is_iomem)
 > 219					memcpy_toio(ptr, (void __iomem *)(elf_data + offset), filesz);
   220				else
   221					memcpy(ptr, elf_data + offset, filesz);
   222			}
   223	
   224			/*
   225			 * Zero out remaining memory for this segment.
   226			 *
   227			 * This isn't strictly required since dma_alloc_coherent already
   228			 * did this for us. albeit harmless, we may consider removing
   229			 * this.
   230			 */
   231			if (memsz > filesz) {
   232				if (is_iomem)
   233					memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
   234				else
   235					memset(ptr + filesz, 0, memsz - filesz);
   236			}
   237		}
   238	
   239		return ret;
   240	}
   241	EXPORT_SYMBOL(rproc_elf_load_segments);
   242	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--PEIAKu/WMn1b1Hv9
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--PEIAKu/WMn1b1Hv9--
