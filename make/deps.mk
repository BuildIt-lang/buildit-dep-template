
$(BUILD_DIR)/buildit.dep: $(BUILDIT_DEPS) 
	$(MAKE) -C $(BUILDIT_DIR) $(BUILDIT_FLAGS)
	touch $(BUILD_DIR)/buildit.dep
